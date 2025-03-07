import 'package:flutter/material.dart';
import 'package:flutter_yay_app/theme.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildListTile('다가오는 캠핑', '캠핑 일정을 등록해 보세요'),
        _buildListTile('내가 다녀온 캠핑장', '다녀온 캠핑장을 등록해 보세요'),
      ],
    );
  }

  Widget _buildListTile(String title, String subTitle) {
    return ListTile(
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Color(0xFF15482D),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 15,
        ),
      ),
      title: Text(title),
      subtitle: Text(
        subTitle,
        style: textTheme().bodyMedium,
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
    );
  }
}
