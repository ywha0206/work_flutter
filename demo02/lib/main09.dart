// 화살표 함수 (람다 표현식)
void main() {
  int num1 = 500;
  int num2 = 10;

  print('더하기 ::: ${add(num1, num2)}');
  print('더하기2 ::: ${add2(num1, num2)}');
  print('빼기 ::: ${sub(num1, num2)}');
  print('곱하기 ::: ${mul(num1, num2)}');
  print('나누기 ::: ${div(num1, num2)}');

  print('원의 넓이를 구하시오 반지름 : 2.5  ::: ${circle(2.5)}');
  print('직사각형의 넓이를 구하시오 가로: 3.5 세로 : 5  ::: ${square(3.5, 5)}');
}

// 함수의 선언부, 구현부
// 재활용 하고 싶다면 --> 함수 --> 좀 더 간결 --> 화살표 함수
int add(int n1, int n2) {
  return n1 + n2;
}

int add2(int n1, int n2) => n1 + n2;
int sub(int n1, int n2) => n1 - n2;
int mul(n1, n2) => n1 * n2;
double div(n1, n2) => n1 / n2;

var circle = (double r) => r * r * 3.14;
var square = (width, height) => width * height;
