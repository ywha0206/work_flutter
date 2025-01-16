import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_app/constants.dart';

class ShoppingCartBody extends StatefulWidget {
  const ShoppingCartBody({super.key});

  @override
  State<ShoppingCartBody> createState() => _ShoppingCartBodyState();
}

class _ShoppingCartBodyState extends State<ShoppingCartBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            _buildBodyNameAndPrice(),
            const SizedBox(height: 10.0),
            _buildBodyRatingAndReviewCount(4, 45),
            const SizedBox(height: 20.0),
            _buildBodyColorOptions([
              Colors.black,
              Colors.green,
              Colors.orange,
              Colors.white,
              Colors.blueAccent,
            ]),
            const SizedBox(height: 30.0),
            _buildBodyButton(),
          ],
        ),
      ),
    );
  }

  // end of build
  Widget _buildBodyNameAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Urban Soft AL 10.0',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$699',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 2. 별점 리뷰 카운트
  Widget _buildBodyRatingAndReviewCount(int counting, int reviews) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStarCounting(counting),
        Row(
          children: [
            Text(
              'review',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '(${reviews})',
              style: TextStyle(color: Colors.blue),
            )
          ],
        )
      ],
    );
  }

  Widget _buildStarCounting(int counting) {
    return Row(
      children: [
        for (int i = 1; i <= counting; i++)
          Icon(Icons.star, color: Colors.amber),
        for (int v = 0; v < 5 - counting; v++)
          Icon(Icons.star, color: Colors.black12),
      ],
    );
  }

  // 3. 색상 옵션 선택
  Widget _buildBodyColorOptions(List<Color> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Options',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            ...List.generate(colors.length, (index) {
              return _buildColorOption(colors[index]);
            })
          ]
          //for (Color c in colors) _buildColorOption(c),
          ,
        )
      ],
    );
  }

  // 4. 색상 옵션 위젯을 만드는 함수
  Widget _buildColorOption(Color color) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // positioned 위젯 활용
          Positioned(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
          Positioned(
              child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(50.0)),
          ))
        ],
      ),
    );
  }

  // 5. 버튼 만들기
  Widget _buildBodyButton() {
    return TextButton(
      onPressed: () {},
      child: Text('Add to Cart'),
    );
  }
} // end of body
