import 'package:emaar/features/on_boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/utils/app_theme/app_theme.dart';

void main() {
  runApp(const EmaarApp());
}

class EmaarApp extends StatelessWidget {
  const EmaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emaar App',
      // for Localization
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'), // العربية فقط حالياً
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // for themes
      theme: AppTheme.lightTheme,
      home: OnBoardingView(),
    );
  }
}
