import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_app/app/app_module.dart';
import 'package:tractian_app/app/app_widget.dart';

const String baseUrl = 'https://fake-api.tractian.com';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
