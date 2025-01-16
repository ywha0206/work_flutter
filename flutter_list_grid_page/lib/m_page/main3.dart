import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CircularCardCarousel(),
    );
  }
}

class CircularCardCarousel extends StatefulWidget {
  @override
  _CircularCardCarouselState createState() => _CircularCardCarouselState();
}

class _CircularCardCarouselState extends State<CircularCardCarousel> {
  late PageController _pageController;
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.cyan,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.3);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {}); // 초기화 이후의 상태 갱신
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  // 현재 페이지 값 계산
                  double currentPage = 0;
                  if (_pageController.hasClients) {
                    currentPage = _pageController.page ??
                        _pageController.initialPage.toDouble();
                  }

                  // offset 계산
                  double offset = (index - currentPage).clamp(-1, 1).toDouble();

                  // 곡선 경로 위치 및 크기 조정
                  double rotation = offset * pi / 6; // 회전 각도
                  double scale = 1 - (offset.abs() * 0.3); // 크기 조정

                  return Transform.translate(
                    offset: Offset(0, offset.abs() * 80), // Y축 이동
                    child: Transform.rotate(
                      angle: rotation,
                      child: Transform.scale(
                        scale: scale,
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              color: colors[index],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
