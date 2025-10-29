package com.example.rd_client

import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ResolveInfo
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.rd_client/video_apps"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getInstalledVideoApps" -> {
                    try {
                        val videoApps = getInstalledVideoApps()
                        result.success(videoApps)
                    } catch (e: Exception) {
                        result.error("ERROR", "Failed to get video apps: ${e.message}", null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getInstalledVideoApps(): List<Map<String, String>> {
        val packageManager = packageManager
        val videoApps = mutableListOf<Map<String, String>>()

        // Intent to find apps that can handle video files
        val videoIntent = Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(android.net.Uri.parse("content://com.android.externalstorage.documents/document/primary%3AMovies%2Ftest.mp4"), "video/*")
        }

        // Query for apps that can handle video intents
        val resolveInfos: List<ResolveInfo> = packageManager.queryIntentActivities(
            videoIntent,
            PackageManager.MATCH_DEFAULT_ONLY
        )

        // Also check for common video player apps by their capabilities
        val commonVideoMimeTypes = listOf(
            "video/mp4",
            "video/avi",
            "video/mkv",
            "video/3gp",
            "video/webm",
            "video/mov",
            "video/wmv",
            "video/flv"
        )

        val allVideoApps = mutableSetOf<String>()

        // Add apps from video intent query
        for (resolveInfo in resolveInfos) {
            allVideoApps.add(resolveInfo.activityInfo.packageName)
        }

        // Query for each video MIME type to catch more video apps
        for (mimeType in commonVideoMimeTypes) {
            val intent = Intent(Intent.ACTION_VIEW).apply {
                setDataAndType(android.net.Uri.parse("content://"), mimeType)
            }
            
            val mimeResolveInfos = packageManager.queryIntentActivities(
                intent,
                PackageManager.MATCH_DEFAULT_ONLY
            )
            
            for (resolveInfo in mimeResolveInfos) {
                allVideoApps.add(resolveInfo.activityInfo.packageName)
            }
        }

        // Convert package names to app info
        for (packageName in allVideoApps) {
            try {
                val applicationInfo = packageManager.getApplicationInfo(packageName, 0)
                val appName = packageManager.getApplicationLabel(applicationInfo).toString()
                
                // Filter out system apps that aren't primarily video players
                if (!isSystemVideoApp(packageName) || isKnownVideoPlayer(packageName)) {
                    videoApps.add(
                        mapOf(
                            "packageName" to packageName,
                            "appName" to appName,
                            "isSystemApp" to applicationInfo.flags.and(android.content.pm.ApplicationInfo.FLAG_SYSTEM).toString()
                        )
                    )
                }
            } catch (e: PackageManager.NameNotFoundException) {
                // App not found, skip
            }
        }

        return videoApps.sortedBy { it["appName"] }
    }

    private fun isSystemVideoApp(packageName: String): Boolean {
        val systemVideoApps = setOf(
            "com.android.gallery3d",
            "com.google.android.gallery3d",
            "com.android.documentsui"
        )
        return systemVideoApps.contains(packageName)
    }

    private fun isKnownVideoPlayer(packageName: String): Boolean {
        val knownVideoPlayers = setOf(
            "com.mxtech.videoplayer.ad",
            "com.mxtech.videoplayer.pro",
            "org.videolan.vlc",
            "com.bsplayer.bspandroid.free",
            "com.kmplayer.android",
            "com.gsoft.vplayer",
            "com.wondershare.player",
            "air.com.uvideo.player",
            "com.allvideodownloader.vid",
            "com.devhd.feeddroid",
            "com.kmsoftware.video.player"
        )
        return knownVideoPlayers.contains(packageName)
    }
}
