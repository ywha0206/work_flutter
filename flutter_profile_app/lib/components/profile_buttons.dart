import 'package:flutter/material.dart';

// 버튼 만들어 보기
class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFollowButton(),
        _buildMessageButton(),
      ],
    );
  }

  InkWell _buildMessageButton() {
    // InkWell: 터치 이벤트(탭, 더블탭) 감지하고 시각적 피드백도 제공합니다.
    // 터치하고자하는 영역을 감싸서 만들 수 있다.
    return InkWell(
      onTap: () {
        print('버튼 클릭');
      },
      child: Container(
        alignment: Alignment.center,
        width: 160,
        height: 40,
        child: Text(
          'Message',
          style: TextStyle(color: Colors.black87),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  InkWell _buildFollowButton() {
    return InkWell(
      onTap: () {
        print('버튼 클릭');
      },
      child: Container(
        alignment: Alignment.center,
        width: 160,
        height: 40,
        child: Text(
          'Follow',
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
