import 'package:flutter/material.dart';

class CustomHeaderHome extends StatelessWidget {
  final String title;
  final Widget trailing;
  const CustomHeaderHome({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
