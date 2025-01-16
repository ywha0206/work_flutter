class Room {
  final int roomNumber;
  Room(this.roomNumber);
}

class House {
  final String address;
  final Room room;

  House(int roomNumber, this.address) : room = Room(roomNumber) {
    print('내부 스택 호출');
  }

  void displayHouseInfo() {
    print('집주소 : ${address}');
    print('방번호 : ${room.roomNumber}');
  }
}

void main() {
  House h1 = House(21, '부전동');
  h1.displayHouseInfo();
}
