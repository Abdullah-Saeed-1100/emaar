import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const EmaarApp());
}

class EmaarApp extends StatelessWidget {
  const EmaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emaar App',
      theme: ThemeData(primarySwatch: Colors.blue),
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
      home: Scaffold(
        appBar: AppBar(title: const Text('Emaar App')),
        body: const Center(child: Text('Welcome to Emaar App!')),
      ),
    );
  }
}
