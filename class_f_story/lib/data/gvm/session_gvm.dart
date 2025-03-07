// 로그인 페이지, 회원가입 페이지 공통 뷰 모델

import 'package:class_f_story/_core/utils/exception_handler.dart';
import 'package:class_f_story/_core/utils/my_http.dart';
import 'package:class_f_story/data/model/session_user.dart';
import 'package:class_f_story/data/repository/user_repository.dart';
import 'package:class_f_story/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 뷰 모델 --> 화면에서 사용하는 상태(변수)
//         --> 행위(비즈니스 로직) 가질 수 있다

// 뷰모델의 속성 -> 세션 유저
// 뷰모델의 행위 -> 로그인, 로그아웃, 자동로그인
class SessionGvm extends Notifier<SessionUser> {
  // 뷰모델에서 context를 사용하기 위한 방안
  final mContext = navigatorkey.currentContext!;
  final UserRepository userRepository = UserRepository();

  // 초기값 설정
  @override
  SessionUser build() {
    // state ==> SessionUser() 가 된다
    return SessionUser(
      id: null,
      username: null,
      accessToken: null,
      isLogin: false,
    );
  }

  // 로그인 행위
  // 화면에서 뷰 모델에게 로그인 요청
  Future<void> login(String username, String password) async {
    // 서버 측으로 던질 데이터를 구축해야 한다
    try {
      // 요청 http 메세지 body
      final body = {
        'username': username,
        'password': password,
      };

      final (responseBody, accessToken) =
          await userRepository.findByUsernameAndPassword(body);

      // 서버 측에서 통신은 성공했으나 내부 오류로 판단
      if (!responseBody['success']) {
        // 사용자에게 로그인 실패(비번 x, 사용자명 x)
        ExceptionHandler.handleException(
            responseBody['errorMessage'], StackTrace.current);
        return; // 실행의 제어권 반납
      }

      // 1. jwt 토큰을 안전한 금고에 보관 처리
      // I/O 시간이 많이 걸리기 때문에 비동기 처리
      await secureStorage.write(key: 'accessToken', value: accessToken);

      // 2. 뷰모델에 상태 갱신
      // 깊은 복사 처리
      Map<String, dynamic> resData = responseBody['response'];
      state = SessionUser(
        id: resData['id'],
        username: resData['username'],
        accessToken: accessToken,
        isLogin: true,
      );

      // 3. dio 헤더에 JWT 토큰 설정 (객체 상태값 추가)
      // 로그인 이후 인증권한 필요한 api 접근시
      // 매번 금고에 접근해서  dio 속성값 변경해서 호출하는 것은 불편해
      // dio 객체를 전역변수로 설계했다.
      dio.options.headers['Authorization'] = accessToken;

      // 화면 이동 처리
      // Navigator.pushNamed(mContext, '/post/list');
      // 이전에 쌓여있던 stack(화면) 다 파괴하면서 이동 처리
      Navigator.popAndPushNamed(mContext, '/post/list');

      // 모든 예외처리가 설정됨
    } catch (e, stackTrace) {
      // IP 주소가 잘못되었을 때
      // 서버가 종료되어있을 때
      // 트래픽이 몰려서 서버 연결 시간 초과
      ExceptionHandler.handleException('서버 연결 실패', stackTrace);
    }
  }

  // 회원 등록 행위
  // 1. userRepository에 회원 등록 요청
  Future<void> join(String username, String email, String password) async {
    try {
      // map 구조 만들어서 던져보자
      final body = {
        'username': username,
        'email': email,
        'password': password,
      };

      Map<String, dynamic> resBody = await userRepository.save(body);

      // 통신은 성공이지만 내부 판별 오류시 방어적 코드 작성
      if (!resBody['success']) {
        ExceptionHandler.handleException(
            resBody['errorMessage'], StackTrace.current);
        return; // 실행의 제어권 반납
      }

      // 성공하면 회원가입 완료 -> 화면이동 코드
      // ExceptionHandler.handleException('회원가입 성공', StackTrace.current);

      // 바로 화면 이동 처리
      Navigator.pushNamed(mContext, '/login');
    } catch (e, stackTrace) {
      ExceptionHandler.handleException('서버 연결 실패', stackTrace);
    }
  }

  // 로그아웃 행위
  // 0. 예외 처리
  // 1. 디바이스 기기에 토큰 삭제
  // 2. 상태 갱신 -> SessionUser()
  // 3. dio 전역 객체 header 토큰 제거 --> '' 빈 문자열 처리
  // 4. 화면 히스토리 다 파괴하고 LoginPage 이동
  Future<void> logout() async {
    try {
      await secureStorage.delete(key: 'accessToken');
      state = SessionUser(
          id: null, username: null, accessToken: null, isLogin: false);
      dio.options.headers['Authorization'] = '';
      Navigator.pushNamedAndRemoveUntil(mContext, '/login', (route) => false);
    } catch (e, stackTrace) {
      ExceptionHandler.handleException("로그아웃 실패", stackTrace);
    }
  }

  // 자동로그인 행위 ------------------------------------------------------
  // 0. 예외 처리
  // 1. 디바이스 기기에 토큰 확인
  // 2. 디바이스 토큰 유무 확인
  // 3. 토큰 유효성 검사
  // 4. SessionUser 상태 갱신
  // 5. dio 헤더에 토큰 재설정
  // 6. 게시글 목록 페이지 이동
  Future<void> autoLogin() async {
    try {
      // 비동기 처리 --> 코드가 내려가지 않고 완료될 때까지 대기
      // 1. 토큰을 디바이스에서 가져오기
      String? accessToken = await secureStorage.read(key: 'accessToken');

      // 2. JWT 토큰 유무 확인 (없을 경우, 있을 경우)
      if (accessToken == null) {
        Navigator.popAndPushNamed(mContext, '/login');
        return; // 실행의 제어권을 반납
      }

      // 토큰이 있다면 user_repository
      // success --> true / false 로직 설계
      Map<String, dynamic> resBody =
          await userRepository.loginWithToken(accessToken);

      // success --> false
      // 서버 내부 판별 오류
      if (!resBody['success']) {
        Navigator.popAndPushNamed(mContext, '/login');
        return;
      }

      // success --> true
      // 상태 값을 변경할 때 불변 객체를 사용하자.
      // (플러터는 상태값의 변경을 민감하게 감지하기 어려움)
      // 새로운 객체 생성해서 넣는 것 --> 깊은 복사 처리
      // 다운 캐스팅
      Map<String, dynamic> data = resBody['response'];
      state = SessionUser(
        id: data['id'],
        username: data['username'],
        accessToken: accessToken,
        isLogin: true,
      );
      // 상태 변경 완료
      // 혹시 ... DIO 헤더에 accesstoken을 다시 설정하자.
      dio.options.headers['Authorization'] = accessToken;

      //게시글 목록 화면으로 전환
      Navigator.popAndPushNamed(mContext, '/post/list');
    } catch (e, stackTrace) {
      ExceptionHandler.handleException('자동 로그인 중 오류 발생', stackTrace);
      // 화면 파괴하면서 이동 처리
      Navigator.popAndPushNamed(mContext, '/login');
    }
  }
}

// 창고 관리자 선언 (창고 - 뷰모델), 어떤 창고 관리해라 지정
final sessionProvider = NotifierProvider<SessionGvm, SessionUser>(
  () => SessionGvm(),
);
