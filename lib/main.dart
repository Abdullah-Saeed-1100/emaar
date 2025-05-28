import 'package:emaar/features/estate/views/estate_home_view.dart';
import 'package:emaar/features/on_boarding/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/cache_helper.dart';
import 'core/utils/app_theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important
  await CacheHelper.init();
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
      // for Navigation
      home:
          CacheHelper.getBool(CacheKeys.onboardingCompleted)
              ? const EstateHomeView()
              : const OnBoardingViewBody(),
    );
  }
}
