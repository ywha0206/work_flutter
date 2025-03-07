import 'package:class_f_story/data/_vm/post_detail_view_model.dart';
import 'package:class_f_story/data/model/post_detail.dart';
import 'package:class_f_story/ui/pages/post/detail_page/widgets/post_detail_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/constants/size.dart';

class PostDetailBody extends ConsumerWidget {
  final int postId;
  const PostDetailBody({required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Future, Stream, State, Notifier
    PostDetail? model = ref.watch(postDetailProvider(postId));

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            '${model.post.title}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const SizedBox(height: largeGap),
          ListTile(
            title: Text('${model.post.user!.username}'),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child:
                  Image.asset('assets/default_profile.png', fit: BoxFit.cover),
            ),
          ),
          // 권한 처리 (sessionUser.id == post.user.id ) 같다면 보여 주기
          PostDetailButtons(model.post),
          const Divider(),
          const SizedBox(height: largeGap),
          SingleChildScrollView(
            child: Text('${model.post.content}'),
          )
        ],
      ),
    );
  }
}
