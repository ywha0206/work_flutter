import 'package:class_f_story/_core/utils/exception_handler.dart';
import 'package:class_f_story/_core/utils/logger.dart';
import 'package:class_f_story/data/gvm/post_event_notifier.dart';
import 'package:class_f_story/data/model/post_detail.dart';
import 'package:class_f_story/data/repository/post_repository.dart';
import 'package:class_f_story/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailViewModel extends AutoDisposeFamilyNotifier<PostDetail?, int> {
  final mContext = navigatorkey.currentContext!;
  PostRepository postRepository = const PostRepository();

  @override
  PostDetail? build(id) {
    // 습관적으로 종료 콜백 리스너 등록을 하자.
    ref.onDispose(
      () => {
        // 자원 해제 처리
        logger.d('PostDetailViewModel 파괴됨')
      },
    );

    init(id); // 초기 값 (API 통신)
    return null;
  }

  Future<void> init(int id) async {
    try {
      Map<String, dynamic> responseBody = await postRepository.findById(id: id);

      if (!responseBody['success']) {
        ScaffoldMessenger.of(mContext).showSnackBar(
          SnackBar(content: Text('게시글을 불러오지 못했습니다.')),
        );
        return;
      }

      // 성공이라면?
      PostDetail model = PostDetail.fromMap(responseBody['response']);
      state = model;
    } catch (e, stackTrace) {
      ExceptionHandler.handleException('게시글 상세보기 오류 발생', stackTrace);
    }
  }

  // 삭제 기능 추가
  Future<void> deleteById(int id) async {
    try {
      Map<String, dynamic> responseBody = await postRepository.delete(id: id);

      if (!responseBody['success']) {
        ScaffoldMessenger.of(mContext)
            .showSnackBar(SnackBar(content: Text("게시글 삭제 실패")));
        return;
      }

      // post 삭제 이벤트 전파
      ref.read(postEventProvider.notifier).postDelete();

      Navigator.pop(mContext);
    } catch (e, stackTrace) {
      ExceptionHandler.handleException('게시글 삭제 중 오류 발생', stackTrace);
    }
  }
} // end of view model

// 선택된 상세보기 하나당 새로운 상세보기 화면 뷰 모델이 생성되고
// 메모리 누수가 발생할 수 있기 때문에 뷰 모델을 파괴시켜주어야 한다.
final postDetailProvider =
    NotifierProvider.autoDispose.family<PostDetailViewModel, PostDetail?, int>(
  () {
    return PostDetailViewModel();
  },
);
