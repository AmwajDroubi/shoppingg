import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyImageSlider extends StatefulWidget {
  final List<Image> annansumns;
  MyImageSlider({super.key, required this.annansumns});

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  // final myitems = [
  //   Image.asset('assets/shop/0.jpg'),
  //   Image.asset('assets/shop/1.jpg'),
  //   Image.asset('assets/shop/2.jpg'),
  //   Image.asset('assets/shop/3.jpg'),
  //   Image.asset('assets/shop/4.jpg'),
  //   Image.asset('assets/shop/5.jpg'),
  // ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 200,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                myCurrentIndex = index;
              });
            },
          ),
          items: widget.annansumns,
        ),
        AnimatedSmoothIndicator(
          activeIndex: myCurrentIndex,
          count: widget.annansumns.length,
          effect: WormEffect(
            dotHeight: 12,
            dotWidth: 12,
            spacing: 10,
            dotColor: Colors.grey,
            activeDotColor: Colors.blue,
            paintStyle: PaintingStyle.fill,
          ),
        )
      ],
    )));
  }
}
