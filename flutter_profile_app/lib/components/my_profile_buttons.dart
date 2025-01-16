import 'package:flutter/material.dart';

class MyProfileButtons extends StatelessWidget {
  const MyProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildOutlineButton(Colors.blueAccent, Colors.white, 'Follow', 160),
        _buildOutlineButton(Colors.white, Colors.black87, 'Message', 160),
      ],
    );
  }

  SizedBox _buildOutlineButton(
      Color buttonColor, Color textColor, String title, double width) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          print('팔로우합니다.');
        },
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
