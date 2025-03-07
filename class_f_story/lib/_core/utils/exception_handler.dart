import 'package:class_f_story/main.dart';
import 'package:flutter/material.dart';

import 'logger.dart';

class ExceptionHandler {
  //스태틱 - 클래스 이름으로 접근 가능
  static void handleException(dynamic exception, StackTrace stackTrace) {
    logger.e('Exception : $exception');
    logger.e('StackTrace : $stackTrace');

    // 간혹 비동기 작업시 currentContext 사라질 수 있다
    final mContext = navigatorkey.currentContext;
    if (mContext == null) return;

    // 시스템 키보드가 있다면 내려주자
    FocusScope.of(mContext).unfocus();

    ScaffoldMessenger.of(mContext).showSnackBar(
      SnackBar(
        content: Text(exception.toString()),
      ),
    );
  }
}
