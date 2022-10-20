import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/widgets/product/offer_card.dart';
import 'package:beautify/ui/widgets/product/product_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferCarousel extends StatefulWidget {
  final bool autoplay;
  final List<String> imageUrls;
  OfferCarousel({required this.imageUrls, required this.autoplay});

  @override
  State<OfferCarousel> createState() => _OfferCarouselState();
}

class _OfferCarouselState extends State<OfferCarousel> {
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
        count: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: false,
            viewportFraction: 1,
            pageSnapping: true,
            aspectRatio: 17 / 9,
            // height: MediaQuery.of(context).size.height * 0.25,
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
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return OfferCard(
              image: widget.imageUrls[index],
            );
          },
        ),
        _buildIndicator(),
      ],
    );
  }
}
