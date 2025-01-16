// 익명 함수
// 람다 표현식
void main() {
  // 1단계 - 이름이 없는 함수(선언을 하더라도 외부에서 사용할 방법이 없다.)
  //변수에 할당하지 않고 바로 익명함수를 호출하는 것은 dart에서 불가능
  (int number) {
    return 100 + number;
  };

  // 2단계 -  함수를 변수에 담을 수 있다
  // 다트에서 함수의 타입 Function
  Function(int) square = (int number) {
    return number * number;
  };

  // 3단계
  var sub = (int number1, int number2) {
    return number1 - number2;
  };

  // 4단계 - dart에서는 매개변수 데이터 타입도 생략이 가능하다
  var add = (number1, number2) {
    return number1 + number2;
  };

  //두 수의 곱하기 익명 함수를 정의하고 그 함수를 변수에 담는 식을 완성하세요
  var multi = (num1, num2) {
    return num1 * num2;
  };

  print('3의 제곱은 ::: ${square(3)}');
  print('10에서 5를 빼면 ::: ${sub(10, 5)}');
  print('두 수를 더하면 ::: ${add(3, 55)}');
  print('두 수를 곱하는 함수 ::: ${multi(5, 9)}');
} //end of main
