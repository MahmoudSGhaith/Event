
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:event/core/resources/theme_manger/theme_manger.dart';
import 'package:event/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcomeScreen,
      routes: AppRoutes.appRoutes,
      theme: ThemeManger.lightTheme,
      darkTheme: ThemeManger.darkTheme,
      themeMode: configProvider.currentTheme,
      locale: Locale(configProvider.currentLanguage),
    );
  }
}