//dart:core - imported always

import 'dart:io';

example_1() {
  var firstname = "k";
  String lastname = "k";

  print(firstname + ' ' + lastname);
}

example_2() {
  stdout.writeln('what is your name?');
  var name = stdin.readLineSync();
  print('$name');
}

example_3() {
  /**
   * datatypes - int, double, String, bool, dynamic
   */
  dynamic weakVariable = 100;
  print('weakVariable 1 : $weakVariable\n');

  weakVariable = "hello";
  print('weakVariable 2 : $weakVariable\n');

  weakVariable = null; // everything is a obj, even
  print('weakVariable 3 : $weakVariable\n');

  var s1 = 'It\'s a new day';
  var s2 = r"It's a new ray \n "; // raw string
  print(s1 + ' ' + s2);

  var s3 = """multi line 
  strings
  """;
  print(s3);
}

example_4() {
  ///string to int
  var one = int.parse('23');
  var onepointone = double.parse('2.3');
  print(one);
  print(onepointone);

  ///double to string
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);

  var num; // unassigned
  print(num); //null

  const aConstString = 'hello';
  const aConstBool = true;
  print(aConstBool.runtimeType);
  print(aConstString.runtimeType);
}

class Num {
  int num = 10;
}

example_5() {
  var n;
  // var n = Num();
  var number;
  // number = n?.num; // checks for null
  number = n?.num ?? 0; // assign 0 as default for null
  print(number);
  var number2 = null;
  print(number2 ??= 1000);
  print(number2);

  var x = 100;
  // check typedef
  if (x is int) {
    print('integer');
  }
}

main(List<String> args) {
  // example_1();
  // example_2();
  // example_3();
  // example_4();
  example_5();
}
