// 1. 게시글 이벤트 정의
// A ~ Z 중에 A ~ D 까지만 필요 --> Enum
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PostAction {
  none, // 아무런 이벤트도 발생하지 않음
  created, // 게시글 생성
  updated, // 게시글 수정
  deleted, // 게시글 삭제
}

// 2. 이벤트 노티파이어 생성
class PostEventNotifier extends Notifier<PostAction> {
  @override
  PostAction build() {
    // 초기값 설정
    return PostAction.none;
  }

  // 행위 설계
  void postCreate() => state = PostAction.created;

  void postUpdate() => state = PostAction.updated;

  void postDelete() => state = PostAction.deleted;

  // 이벤트 처리 후 상태를 초기화하는 코드(중복 이벤트 방지)
  void reset() => state = PostAction.none;
}

// 3. 이벤트 프로바이더 생성
final postEventProvider = NotifierProvider<PostEventNotifier, PostAction>(
  () => PostEventNotifier(),
);
