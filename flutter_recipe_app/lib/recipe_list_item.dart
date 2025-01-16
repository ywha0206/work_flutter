import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  final String imageName;
  final String title;
  // 하드코딩
  const RecipeListItem(this.imageName, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지 비율 지정할 수 있다
          AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/${imageName}.jpeg',
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(height: 10),
          // 텍스트1
          Text(title, style: TextStyle(fontSize: 20)),
          // 텍스트2
          Text(
              'Have you ever..To add assets to your application, add an assets section, '
              'like this To add assets to your application, add an assets section, like this',
              style: TextStyle(color: Colors.black38, fontSize: 12)),
        ],
      ),
    );
  }
}
