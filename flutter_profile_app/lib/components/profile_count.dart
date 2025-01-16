import 'package:flutter/material.dart';

class ProfileCount extends StatelessWidget {
  const ProfileCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '50',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Posts',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1, color: Colors.blueAccent),
          Column(
            children: [
              Text(
                '10',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Likes',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1, color: Colors.blueAccent),
          Column(
            children: [
              Text(
                '3',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Share',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
