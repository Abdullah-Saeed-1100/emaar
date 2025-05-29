import 'package:emaar/core/services/get_it_service.dart';
import 'package:emaar/core/services/simple_bloc_observer.dart';
import 'package:emaar/core/utils/app_keys.dart';
import 'package:emaar/features/estate/views/estate_home_view.dart';
import 'package:emaar/features/on_boarding/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/services/cache_helper.dart';
import 'core/utils/app_theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important

  // Initialize CacheHelper
  await CacheHelper.init();

  // Initialize Supabase
  await Supabase.initialize(
    url: AppKeys.supabaseUrl,
    anonKey: AppKeys.supabaseAnonKey,
  );

  // Setup service locator
  ServiceLocator.setup();

  // Set up Bloc observer
  Bloc.observer = SimpleBlocObserver();

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
