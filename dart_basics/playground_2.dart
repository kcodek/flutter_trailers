example_1(count) {
  for (var i = 0; i < count; i++) {
    print(i);
  }

  var numbers = [10, 20, 30];
  for (var i = 0; i < numbers.length; ++i) {
    print(numbers[i]);
  }

  for (var n in numbers) {
    print(n);
  }

  numbers.forEach((element) => {print(element)});
}

example_2() {
  List<String> names_1 = ["jack", "jill"];
  // List<String> names_constant = const ["jack", "jill"];
  print(names_1[0]);
  List names = ["jack", "jill", 2, 10.3];
  print(names[1]);
  print(names.length);

  //list copy
  var names_2 = names_1;
  names_2.forEach((element) => {print(element)});
  names_1[1] = 'jinx';
  names_2.forEach((element) => {print(element)});
  var names_3 = [...names_2]; //use spread operator for copy
  names_2[0] = "james";
  print(names_3);
  print(names_2);

  //Set
  var halogens = <String>{};
  var halogen_map = {};
  print(halogens.runtimeType);
  print(halogen_map.runtimeType);

  //Map
  var gifts = Map();
  gifts['first'] = 'Mango';
  var gifts_2 = {'second': "jackfruit"};
  print(gifts['first']);
  print(gifts_2['second']);
}

dynamic square(var num) {
  return num * num;
}

dynamic cube(var num) => num * num * num;

void showOutput(var msg) {
  print(msg);
}

//named params are optional
dynamic sum(var num1, {var num2}) => num1 + (num2 ?? 0);
// dynamic sum(var num1, {var num2 = 0}) => num1 + num2;

// make positional param optional using []
// dynamic sum(var num1, [var num2]) => num1 + num2 ?? 0;

example_3() {
  showOutput(square(3));
  showOutput(square(3.14));
  showOutput(square.runtimeType);
  showOutput(cube(4));
  showOutput(cube.runtimeType);
}

void main(List<String> args) {
  // example_1(4);
  // example_2();
  example_3();
  print(sum(19));
  print(sum(19, num2: 3));
}
