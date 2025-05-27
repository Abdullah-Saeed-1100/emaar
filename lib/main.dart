import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(title: const Text('Emaar App')),
        body: const Center(child: Text('Welcome to Emaar App!')),
      ),
    );
  }
}
