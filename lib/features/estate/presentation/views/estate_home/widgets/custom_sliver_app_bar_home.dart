import 'package:emaar/core/utils/app_images.dart';
import 'package:emaar/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSliverAppBarHome extends StatelessWidget {
  const CustomSliverAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 80,
      floating: false,
      // pinned: true,
      stretch: true,
      elevation: 0,
      // backgroundColor: Colors.black12,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.homeAppBarBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black87,
                    Colors.black38,
                    // Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Title and subtitle
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('مرحباً بك في', style: AppTextStyles.body14),
                            Text('إعمار', style: AppTextStyles.heading26),
                          ],
                        ),
                        // logo icon
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(AppImages.logo),
                              fit: BoxFit.contain,
                            ),
                          ),
                          // child: Icon(
                          //   Icons.notifications_outlined,
                          //   color: Colors.white,
                          //   size: 24,
                          // ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
