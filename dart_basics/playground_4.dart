//method overriding

class X {
  String name;
  X(this.name);

  void showOutput() {
    print(this.name);
  }

  dynamic square(dynamic val) {
    return val * val;
  }
}

class Y extends X {
  Y(String name) : super(name);

  @override // to let programmer's know
  void showOutput() {
    print('hello' + ' ' + this.name);
  }
}

example_1() {
  X x1 = X('anish');
  x1.showOutput();
  print(x1.square(2));
  Y y1 = Y('giri');
  y1.showOutput();
  print(y1.square(20));
}

/// Getters  and Setters
/// no paranthesis needed for calling
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);
  //Define two calculated properties: right and bottom
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

example_2() {
  var rect = Rectangle(3, 4, 20, 15);
  print(rect.left);
  rect.right = 12;
  print(rect.left);
}

//Exception handling
int mustGreaterThanZero(int val) {
  if (val <= 0) {
    throw Exception('value must be greater than zero');
  }
  return val;
}

void verifyTheValue(var val) {
  var valueVerfication;
  try {
    valueVerfication = mustGreaterThanZero(val);
  } catch (e) {
    // No specified type, handles all exceptions - use 'on' for specific types
    print(e);
  } finally {
    if (valueVerfication == null) {
      print('value is not accepted');
    } else {
      print('verified:$valueVerfication');
    }
  }
}

void main(List<String> args) {
  // example_1();
  // example_2();
  verifyTheValue(10);
  verifyTheValue(0);
}
