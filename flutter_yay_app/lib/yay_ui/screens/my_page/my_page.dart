import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://picsum.photos/200',
                    width: 70,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'YH Park',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Column(
            children: [
              _buildMyPageMenu(
                  Icons.calendar_today, 'camping schedule', 'asfdjakljfewlkj'),
              _buildMyPageMenu(
                  Icons.calendar_today, 'camping schedule', 'asfdjakljfewlkj'),
              _buildMyPageMenu(
                  Icons.calendar_today, 'camping schedule', 'asfdjakljfewlkj'),
              _buildMyPageMenu(
                  Icons.calendar_today, 'camping schedule', 'asfdjakljfewlkj'),
              _buildMyPageMenu(
                  Icons.calendar_today, 'camping schedule', 'asfdjakljfewlkj'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMyPageMenu(IconData mIcon, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        mIcon,
        color: Color(0xFF15482D),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
