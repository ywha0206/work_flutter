class Resident {
  final String name;
  final int roomNumber;
  Resident(this.name, this.roomNumber);

  void displayResident() {
    print('${roomNumber}호 ${name}');
  }
}

class Apartment {
  final String buildingName;
  final int floor;
  List<Resident> residents;

  Apartment(this.buildingName, this.floor) : residents = [] {
    print('내부 스택');
  }

  void displayApartmentInfo() {
    print('건물이름 : ${buildingName}');
    print('층고 : ${floor}');
    for (var r in residents) {
      r.displayResident();
    }
  }

  void addResident(Resident r) {
    residents.add(r);
  }
}

void main() {
  Apartment apt1 = Apartment('샛별빌딩', 4);
  Apartment apt2 = Apartment('햇살빌딩', 5);

  Resident r1 = Resident('김철학', 205);
  Resident r2 = Resident('김문학', 401);
  Resident r3 = Resident('김수학', 103);

  apt1.addResident(r1);
  apt1.addResident(r2);
  apt2.addResident(r3);

  apt1.displayApartmentInfo();
  apt2.displayApartmentInfo();
}
