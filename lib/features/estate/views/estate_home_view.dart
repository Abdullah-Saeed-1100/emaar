import 'package:flutter/material.dart';

class EstateHomeView extends StatelessWidget {
  const EstateHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estate Home')),
      body: const Center(child: Text('Welcome to the Estate Home View!')),
    );
  }
}
