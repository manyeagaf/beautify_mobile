import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/widgets/product/product_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TrendingCarousel extends StatefulWidget {
  final List<Product> trendingProducts;
  final bool autoplay;
  TrendingCarousel({required this.trendingProducts, required this.autoplay});

  @override
  State<TrendingCarousel> createState() => _TrendingCarouselState();
}

class _TrendingCarouselState extends State<TrendingCarousel> {
  CarouselController carouselController = CarouselController();
  var activeIndex = 0;

  _buildIndicator() {
    return AnimatedSmoothIndicator(
        effect: ScrollingDotsEffect(
          activeDotColor: kPrimaryColor,
          fixedCenter: true,
          dotWidth: 5,
          dotHeight: 5.0,
          offset: 5.0,
          spacing: 8.0,
          activeDotScale: 1.7,
        ),
        activeIndex: activeIndex,
        count: widget.trendingProducts.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: true,
            viewportFraction: 1,
            pageSnapping: true,
            height: MediaQuery.of(context).size.height * 0.35,
            autoPlay: widget.autoplay,
            onPageChanged: (index, reason) {
              setState(
                () {
                  activeIndex = index;
                },
              );
            },
          ),
          carouselController: carouselController,
          itemCount: widget.trendingProducts.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = widget.trendingProducts[index];
            return ProductCard(product: widget.trendingProducts[index]);
          },
        ),
        _buildIndicator(),
      ],
    );
  }
}
