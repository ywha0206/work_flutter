import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          slider(
            [
              Image.asset('assets/images/yay_home_1.jpg', fit: BoxFit.cover),
              Image.asset('assets/images/yay_home_2.jpg', fit: BoxFit.cover),
              Image.asset('assets/images/yay_home_3.jpg', fit: BoxFit.cover),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: 60.0,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(30)),
              child: Text(
                'Click',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10.0),
      indicator(
        [
          Image.asset('assets/images/yay_home_1.jpg'),
          Image.asset('assets/images/yay_home_2.jpg'),
          Image.asset('assets/images/yay_home_3.jpg'),
        ],
      ),
    ]);
  }

  // 사진을 슬라이드하는 화면
  Widget slider(images) => CarouselSlider(
        items: images,
        options: CarouselOptions(
          height: 580,
          autoPlay: false,
          viewportFraction:
              1, // 각 페이지가 차지하는 viewport의 정도임. 0.8로 설정하면 Indicator 가 없는 슬라이드 구성가능함.
          enlargeCenterPage: true, // 이미지보다 화면이 클 수 있는지 설정
          initialPage: 0, // 초기 페이지 인덱스
          onPageChanged: (index, reason) => setState(() {
            activeIndex = index; // 페이지가 변경될 때, indicator 의 인덱스를 변경함.
          }),
        ),
      );

  // Indicator
  Widget indicator(images) => Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.bottomCenter,
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: JumpingDotEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.black87,
            dotColor: Colors.grey),
      ));
}
