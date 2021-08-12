class Person {
  String name;
  int age;

  // default constructor
  Person(this.name, [this.age = 18]);

  ///TODO: named construction
  // Person.guest() {
  //   name = 'Guest';
  //   age = 18;
  // }

  void showOutput() {
    print(name);
    print(age);
  }
}

class X {
  final name; // type will be defined  by inferred value
  static const int age = 19;
  X(this.name);
}

example_1() {
  // Person person_1 = Person();
  // person_1.name = 'l';
  // person_1.age = '23';
  Person person_1 = Person('m', 23);
  person_1.showOutput();
  Person person_2 = Person('l');
  person_2.showOutput();

  // var person_3 = Person.guest();
  // person_3.showOutput();

  var x = X('djin');
  print(x.name);
  print(X.age); // by class name
  // x.name = 'genie'; // not allowed after contruction
}

/// Inheritance, classes
class Vehicle {
  String model;
  int year;

  Vehicle(this.model, this.year) {
    print(this.model);
    print(this.year);
  }

  void showOutput() {
    print(model);
    print(year); // same as this.year
  }
}

class Car extends Vehicle {
  double price;

  Car(String model, int year, this.price) : super(model, year);

  void showOutput() {
    super.showOutput();
    print(this.price);
  }
}

example_2() {
  var car1 = Car('Accord', 2014, 150000);
  car1.showOutput();
}

void main(List<String> args) {
  // example_1();
  example_2();
}
