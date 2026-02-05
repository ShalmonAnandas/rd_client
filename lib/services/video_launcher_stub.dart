import 'package:url_launcher/url_launcher.dart';

Future<void> launchVideoImpl({
  required String url,
  String? defaultVideoApp,
  String? referer,
}) async {
  final uri = Uri.parse(url);
  final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!launched) {
    throw Exception('Could not launch video');
  }
}
