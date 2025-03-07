import 'package:flutter/material.dart';

import 'post_write_form.dart';

class PostWriteBody extends StatelessWidget {
  const PostWriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // 기본적으로 사용
          Flexible(
            child: PostWriteForm(),
          ),
        ],
      ),
    );
  }
}
