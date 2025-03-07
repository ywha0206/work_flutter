import 'package:flutter/material.dart';

import '../detail_page/widgets/post_detail_body.dart';

class PostUpdatePage extends StatelessWidget {
  int postId;
  PostUpdatePage({required this.postId, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: PostDetailBody(
          postId: postId,
        ),
      ),
    );
  }
}
