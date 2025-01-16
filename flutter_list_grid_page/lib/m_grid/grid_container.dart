import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final int index;
  const GridItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지 비율 지정할 수 있다
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    'assets/images/고양이${index + 1}.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(height: 10),
          // 텍스트1
          Text('고양이 ${index + 1}', style: TextStyle(fontSize: 15)),
          // 텍스트2
          Text('냥냥냥 먕먕 밍엙 와까꽁',
              style: TextStyle(color: Colors.black38, fontSize: 12)),
        ],
      ),
    );
  }
}
