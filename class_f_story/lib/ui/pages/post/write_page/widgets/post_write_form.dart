import 'package:class_f_story/_core/constants/size.dart';
import 'package:class_f_story/data/_vm/post_write_view_model.dart';
import 'package:class_f_story/ui/pages/post/list_page/post_list_page.dart';
import 'package:class_f_story/ui/widgets/custom_elevated_button.dart';
import 'package:class_f_story/ui/widgets/custom_text_area.dart';
import 'package:class_f_story/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostWriteForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  PostWriteForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // post_write_view_model 만드는 게 핵심

    // 뷰모델 상태를 구독
    // (title, content, isWrited...)
    final data = ref.watch(postWriteViewModelProvider);

    // 뷰모델 행위 사용
    final vm = ref.read(postWriteViewModelProvider.notifier);

    return Form(
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomTextFormField(hint: 'title', controller: _titleController),
          const SizedBox(height: smallGap),
          CustomTextArea(hint: 'content', controller: _contentController),
          const SizedBox(height: smallGap),
          CustomElevatedButton(
            text: '글쓰기',
            click: () async {
              vm.createPost(
                title: _titleController.text.trim(),
                content: _contentController.text.trim(),
              );
              if (data.$3 == true) {
                _titleController.clear();
                _contentController.clear();
                //
                // await Future.delayed(Duration(milliseconds: 500)).then(
                //   (value) {
                //     Navigator.popAndPushNamed(context, '/post/list');
                //   },
                // );
              }
            },
          )
        ],
      ),
      key: _formKey,
    );
  }
}
