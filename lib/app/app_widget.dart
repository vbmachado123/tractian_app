import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_app/app/core/app_colors.dart';

import 'modules/splash/splash_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.linear,

      theme: ThemeData(
        focusColor: AppColors.blue0,
        primarySwatch: Colors.blueGrey,
      ),
      // supportedLocales: [Locale('pt', 'BR')],
      initialRoute: SplashModule.route,
    ).modular();
  }
}
