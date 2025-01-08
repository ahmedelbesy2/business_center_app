import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'package:core/core.dart';
Future<void> main() async {
  await GetStorage.init();
  // WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ModularApp(
      debugMode: false,
      module: AppModule(),
      child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          saveLocale: true,
          useFallbackTranslations: true,
          startLocale: const Locale("en"),
          path: 'lang',
          fallbackLocale: const Locale('en'),
          child: const AppWidget()),
    ),
  );
}
