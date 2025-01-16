// Mixin - 1 (사전기반지식이 있어야 이해 가능)
// Dart에서 클래스의 코드를 여러 클래스의 계층에서 재사용할 수 있도록 해주는 코드 조각
// 책 내용
// Mixin을 사용하게 되면 다중 상속의 문제를 해결할 수 있고 컴포지션을 사용하지 않고
// 다른 클래스의 코드를 재사용 할 수 있다.

// 집중!
// OOP에서 객체간의 관계를 정의하는 개념들
// 연관관계(assosiation?)
//   - 객체들이 서로 연결되어 있는 일반적인 관계 (넒은 범위의 개념)
//   - 컴포지션 관계
//   - 집합 관계

// 1.1 컴포지션 관계
//      부분-전체 관계 중에서 생명주기가 밀접하게 연관된 강한 소유 관계를 의미한다.
//      전체 객체가 소멸될 때 부분 객체도 함께 소멸됩니다.
//      예시 : 차와 엔진 클래스도 컴포지션
//      [강한 소유 관계]

// 1.2 집합 관계
//      부분-전체 관계 중에서 전체와 부분의 생명주기가 독립적인 관계를 말한다.
//      전체 객체가 소멸될 때 부분 객체는 독립적으로 존재할 수 있다.
//      예시 : 부서와 직원 클래스를 생각할 수 있다.
//      부서 객체가 소멸되더라도 직원 객체는 계속 존재할 수 있음
//      [약한 소유 관계]

// 2. 이니셜라이저 리스트 ( : )
// 이니셜라이저 리스트는 상속 관계 뿐만 아니라 연관관계 (집합관계 및 컴포지션 관계) 에서도
// 클래스의 필드 초기화 및 객체 생성에 유용하게 사용할 수 있다.

class Engine {
  final String type;
  Engine(this.type);

  void startEngine() {
    print('${type} 엔진이 시동됩니다.');
  }
}

class Car {
  final Engine engine;

  // Car(this.engine);
  // 생성자 코드이다 1. 축약 버전 --> 생성자 바디 부분을 생략했다.
  // Car(String engineType) : engine = Engine(engineType);
  // 생성자 코드이다 2.
  Car(String engineType) : engine = Engine(engineType) {
    print('생성자 호출시 내부 스택 메모리가 호출된다.');
  }

  void startCar() {
    engine.startEngine();
    print('차가 출발합니다.');
  }
}

//////////////////////////////////////////////////////////////////////
// 집합 관계를 만들어 보자

class Employee {
  final String name;

  Employee(this.name);

  void displayEmployeeInfo() {
    print('직원 이름: ${name}');
  }
}

class Department {
  final String deptName;
  final List<Employee> employees;

  Department(this.deptName) : employees = [] {
    print('=== Department 생성자 내부 스택 호출 ===');
  }

  void addEmployee(Employee emp) {
    employees.add(emp);
  }

  void displayDepartmentInfo() {
    print('------------------------');
    print('부서 이름 : ${deptName}');
    for (var emp in employees) {
      emp.displayEmployeeInfo();
    }
  }
}

void main() {
  // Engine v8engine = Engine('v8');
  // Car car1 = Car(v8engine);

  Car car1 = Car('v8');
  // 누군가 참조하고 있지 않다면 gc 대상이 된다.
  // gc : 가비지 컬렉터

  print('---------------------------------');

  Department dept1 = Department('개발팀');
  Department dept2 = Department('디자인팀');
  Employee emp1 = Employee('홍길동');
  Employee emp2 = Employee('김철수');
  Employee emp3 = Employee('야스오');

  dept1.addEmployee(emp1);
  dept1.addEmployee(emp2);
  dept2.addEmployee(emp3);

  dept1.displayDepartmentInfo();
  dept2.displayDepartmentInfo();
}
