import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/features/estate/data/models/property_test_model.dart';
import 'package:emaar/features/estate/widgets/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselViewSliverHome extends StatefulWidget {
  const CustomCarouselViewSliverHome({super.key});

  @override
  State<CustomCarouselViewSliverHome> createState() =>
      _CustomCarouselViewSliverHomeState();
}

class _CustomCarouselViewSliverHomeState
    extends State<CustomCarouselViewSliverHome> {
  final PageController _pageController = PageController();
  // بيانات العقارات المميزة للعرض الدوار
  final List<PropertyTestModel> _featuredProperties = [
    PropertyTestModel(
      id: 1,
      title: 'فيلا فاخرة في الرياض',
      price: '2,500,000 ريال',
      location: 'حي الملقا، الرياض',
      imageUrl:
          'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800&h=400&fit=crop',
      beds: 5,
      baths: 4,
      area: 450,
      type: PropertyType.sale,
    ),
    PropertyTestModel(
      id: 2,
      title: 'شقة عصرية للإيجار',
      price: '4,500 ريال/شهر',
      location: 'حي العليا، الرياض',
      imageUrl:
          'https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?w=800&h=400&fit=crop',
      beds: 3,
      baths: 2,
      area: 180,
      type: PropertyType.rent,
    ),
    PropertyTestModel(
      id: 3,
      title: 'منزل عائلي واسع',
      price: '1,800,000 ريال',
      location: 'حي النرجس، الرياض',
      imageUrl:
          'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?w=800&h=400&fit=crop',
      beds: 4,
      baths: 3,
      area: 320,
      type: PropertyType.sale,
    ),
  ];

  int _currentCarouselIndex = 0;
  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        int nextIndex =
            (_currentCarouselIndex + 1) % _featuredProperties.length;
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
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 280,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentCarouselIndex = index;
                });
              },
              itemCount: _featuredProperties.length,
              itemBuilder: (context, index) {
                return CarouselItem(property: _featuredProperties[index]);
              },
            ),
          ),
          SizedBox(height: 16),
          // مؤشرات الصفحات
          SmoothPageIndicator(
            controller: _pageController,
            count: _featuredProperties.length,
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
      ),
    );
  }
}
