// 글쓰기 뷰모델
// 화면 클래스에서 관리해야 하는 데이터, 기능을 여기로 옮기자!
// 상태관리까지

import 'package:class_f_story/_core/utils/exception_handler.dart';
import 'package:class_f_story/_core/utils/logger.dart';
import 'package:class_f_story/data/gvm/post_event_notifier.dart';
import 'package:class_f_story/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_core/utils/my_http.dart';
import '../repository/post_repository.dart';
import '../repository/user_repository.dart';

// dto 만들기 싫어서 배웠던 문법 레코드
// 모델 post 사용해도 되지만 --> 레코드 --> post (모델 활용)
class PostWriteViewModel
    extends Notifier<(String? title, String? content, bool isWriteCompleted)> {
  // 뷰모델에서 컨텍스트를 사용하는 방안
  final mContext = navigatorkey.currentContext!;
  PostRepository postRepository = const PostRepository();

  // 상태값 초기화
  @override
  (String? title, String? content, bool isWriteCompleted) build() {
    // state == (String? title, String? content, bool isWriteCompleted)
    return (null, null, false);
  }

  // 행위 - 게시글 작성
  // 뷰모델에서는 기본 데이터 타입 형태로 설계하자(원자성)
  // 0. 뷰모델에서 예외 처리
  // 1. 데이터 map 구조로 변환 처리
  // 2. 응답 -> success -- false
  // 3. 응답 -> success -- true
  Future<void> createPost(
      {required String title, required String content}) async {
    try {
      final body = {"title": title, "content": content};

      // Response response = await dio.post('/api/post', data: body);
      // Map<String, dynamic> responseBody = response.data;
      Map<String, dynamic> responseBody = await postRepository.save(body);

      // 2
      if (!responseBody['success']) {
        ExceptionHandler.handleException(
            responseBody['errorMessage'], StackTrace.current);
        return;
      }

      // 시스템 키보드가 있다면 자동 닫기
      FocusScope.of(mContext).unfocus();

      // 게시글 완성 메세지
      ScaffoldMessenger.of(mContext)
          .showSnackBar(SnackBar(content: Text('게시글이 등록되었습니다.')));

      // 상태 갱신 처리
      state = (null, null, true);

      //postEventProvider (none 상태를 created 상태로 변경)
      // ref.read(postEventProvider.notifier).postCreate();
      // ref.read(postEventProvider.notifier).reset();

      // Navigator.popAndPushNamed(mContext, '/post/list');
    } catch (e, stackTrace) {
      ExceptionHandler.handleException(e, stackTrace);
    }
  }
}

// 창고 관리자 만들기
final postWriteViewModelProvider = NotifierProvider<
    PostWriteViewModel,
    (
      String? title,
      String? content,
      bool isWriteCompleted
    )>(() => PostWriteViewModel());
