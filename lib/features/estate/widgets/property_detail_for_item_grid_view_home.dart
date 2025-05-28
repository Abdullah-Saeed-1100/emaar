// import 'package:emaar/core/utils/app_images.dart';
// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PropertyDetailForItemGridViewHome extends StatelessWidget {
  final String text;
  final IconData icon;

  const PropertyDetailForItemGridViewHome({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
