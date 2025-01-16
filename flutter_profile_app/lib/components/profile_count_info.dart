import 'package:flutter/material.dart';

// 프로필 카운트 인포 위젯 만들어 보기
class profileCountInfo extends StatelessWidget {
  const profileCountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildInfo('50', 'Posts'),
        _buildLine(),
        _buildInfo('10', 'Likes'),
        _buildLine(),
        _buildInfo('3', 'Share'),
      ],
    );
  }

  Container _buildLine() {
    return Container(
      width: 2,
      height: 50,
      color: Colors.blueAccent,
    );
  }

  Widget _buildInfo(String count, String title) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
