import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rd_client/presentation/screens/home_screen.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConstants.apiToken = await StorageService.instance.getToken();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: AppConstants.alice.getNavigatorKey(),
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
