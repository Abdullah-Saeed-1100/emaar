import 'package:emaar/features/estate/views/estate_home/widgets/custom_header_home.dart';
import 'package:flutter/material.dart';

class HeaderAllProperty extends StatelessWidget {
  const HeaderAllProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomHeaderHome(
        title: 'جميع العقارات',
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.tune, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Text(
                'فلترة',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
