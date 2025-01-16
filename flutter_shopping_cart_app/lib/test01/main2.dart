import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

//이벤트가 일어나면 다시 화면을 그려야 한다.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('전체 build 메서드 호출 : 111111111111111111111111111111');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: TodayWidget(),
                ),
                // 이미지
                Expanded(
                  flex: 1,
                  child: FlutterLogo(
                    size: 300,
                    style: FlutterLogoStyle.markOnly,
                    textColor: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodayWidget extends StatefulWidget {
  const TodayWidget({super.key});

  @override
  State<TodayWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  // 현재 시간 상태를 저장하는 변수
  String timeOfDay = '낮';

  @override
  Widget build(BuildContext context) {
    print('전체 build 메서드 호출 : 222222222222222222222222222222');
    return InkWell(
      onTap: () {
        print('이벤트 리스너 등록');
        timeOfDay = (timeOfDay == '낮' ? '밤' : '낮');
        print('현재 상태값 : ${timeOfDay}');
        // 화면을 새롭게 갱신하라 명령해주어야 한다.
        setState(() {
          print('화면 다시 그려줘 --> build() 재호출');
        });
      },
      child: Container(
        alignment: Alignment.center,
        color: (timeOfDay == '낮') ? Colors.lightBlue : Colors.indigo,
        child: Text(
          timeOfDay,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
