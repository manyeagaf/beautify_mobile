import 'package:beautify/ui/shared/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CaruoselBuilder extends StatefulWidget {
  final List<String> imgUrls;
  final bool autoplay;
  CaruoselBuilder({required this.imgUrls, required this.autoplay});

  @override
  State<CaruoselBuilder> createState() => _CaruoselBuilderState();
}

class _CaruoselBuilderState extends State<CaruoselBuilder> {
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
        count: widget.imgUrls.length);
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
          itemCount: widget.imgUrls.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = widget.imgUrls[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: [
                    InkResponse(
                      child: Image(
                        width: 1000,
                        image: NetworkImage(urlImage),
                        fit: BoxFit.cover,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        _buildIndicator(),
      ],
    );
  }
}
