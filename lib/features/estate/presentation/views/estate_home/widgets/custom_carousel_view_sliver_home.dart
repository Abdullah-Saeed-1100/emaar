import 'package:emaar/core/entities/property_entity.dart';
import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/features/estate/data/models/dummy_data.dart';
import 'package:emaar/features/estate/presentation/views/estate_home/widgets/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../cubits/home_cubit/home_cubit.dart';
import '../../../cubits/home_cubit/home_state.dart';

class CustomCarouselViewSliverHome extends StatefulWidget {
  const CustomCarouselViewSliverHome({super.key});

  @override
  State<CustomCarouselViewSliverHome> createState() =>
      _CustomCarouselViewSliverHomeState();
}

class _CustomCarouselViewSliverHomeState
    extends State<CustomCarouselViewSliverHome> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Skeletonizer(
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: CarouselItem(
                      property: dummyProperties()[0],
                      index: 0,
                      isLoading: true, // تمرير حالة التحميل
                    ),
                  ),
                  SizedBox(height: 16),
                  // مؤشرات الصفحات
                  Container(
                    width: 18,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.primary10,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text("..."),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          } else if (state is HomeErrorState) {
            return Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
          }
          if (state is HomeSuccessState) {
            return CustomCarouselViewSliverHomeWhenSuccess(
              propertiesFetured: state.propertiesFetured,
            );
          }
          return Center(child: Text('لا توجد بيانات لعرضها'));
        },
      ),
    );
  }
}

class CustomCarouselViewSliverHomeWhenSuccess extends StatefulWidget {
  // هذا الكلاس يستخدم لعرض البيانات عندما تكون الحالة ناجحة
  final List<PropertyEntity> propertiesFetured;
  const CustomCarouselViewSliverHomeWhenSuccess({
    super.key,
    required this.propertiesFetured,
  });

  @override
  State<CustomCarouselViewSliverHomeWhenSuccess> createState() =>
      _CustomCarouselViewSliverHomeWhenSuccessState();
}

class _CustomCarouselViewSliverHomeWhenSuccessState
    extends State<CustomCarouselViewSliverHomeWhenSuccess> {
  final PageController _pageController = PageController();

  int _currentCarouselIndex = 0;
  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        int nextIndex =
            (_currentCarouselIndex + 1) % widget.propertiesFetured.length;
        _pageController.animateToPage(
          nextIndex,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        _startAutoSlide();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // تشغيل العرض الدوار التلقائي
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
            itemCount: widget.propertiesFetured.length,
            itemBuilder: (context, index) {
              return CarouselItem(
                property: widget.propertiesFetured[index],
                index: index,
              );
            },
          ),
        ),
        SizedBox(height: 16),
        // مؤشرات الصفحات
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.propertiesFetured.length,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            spacing: 4,
            activeDotColor: AppColors.primary,
            dotColor: AppColors.primary10,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
