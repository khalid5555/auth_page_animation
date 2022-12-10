import 'package:auth_page_animation/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'auth/auth_bindings.dart';
import 'utils/app_theme.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The First',
      defaultTransition: Transition.zoom,
      theme: AppThemes.lt,
      builder: EasyLoading.init(),
      initialBinding: AuthBindings(),
      // themeMode: Auth,
      darkTheme: AppThemes.dk,
      home: const AuthPage(),
    );
  }
}
