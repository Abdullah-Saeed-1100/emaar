import 'package:emaar/features/on_boarding/widgets/on_boarding_content.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_animated.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../estate/views/estate_home_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Helper to get current page safely
  int get _currentPage {
    if (!_pageController.hasClients || _pageController.page == null) return 0;
    return _pageController.page!.round();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (_) => setState(() {}),
          children: const [
            OnBoardingContent(
              image: AppImages.onBoarding1Background,
              title: 'حيّاكم الله في إعمار!',
              description:
                  "دور على بيت العمر، شقة، أو فيلا تناسب راحتك وراحة عيالك. سواء تبي تستقر أو تستثمر، هنا تلقى العقار اللي يناسبك.",
            ),
            OnBoardingContent(
              image: AppImages.onBoarding2Background,
              title: "مع إعمار، اختصر المشوار.",
              description:
                  "بيوت، شقق، وفرص استثمار… كلها بانتظارك.\nجاهز تبدأ مشوارك العقاري؟ إحنا معك خطوة بخطوة… من أول نظرة لين توقيع العقد!",
            ),
          ],
        ),

        Positioned(
          bottom: 120,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: ExpandingDotsEffect(
              dotHeight: 11,
              dotWidth: 11,
              activeDotColor: AppColors.primary,
              dotColor: AppColors.primary10,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 16,
          right: 16,
          child: CustomAnimated(
            child: PrimaryButton(
              text: _currentPage == 0 ? 'التالي' : 'لنبدأ',
              onParsed: () async {
                if (_currentPage == 0) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease,
                  );
                } else {
                  // save Done Onboarding
                  await CacheHelper.saveBool(
                    CacheKeys.onboardingCompleted,
                    true,
                  );

                  // Navigator push replace
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(builder: (context) => EstateHomeView()),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
