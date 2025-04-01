int add(int a, int b) {
  return a + b;
}

int sub(int a, int b) {
  return a - b;
}

Function func(String operator) {
  if (operator == '+') {
    return add;
  } else {
    return sub;
  }
}

void show(fn) {
  // even numberes
  for (var i = 0; i < 10; i++) {
    if (fn(i)) {
      print(i);
    }
  }
}

void main() {
  // show even numbers

  // show((int x) {
  //   return x % 2 == 0;
  // });

  show((int x) {
    return x % 2 == 0;
  });

  var addition = func('+');
  print(addition(1, 2));

  addition = func('-');
  print(sub(2, 1));
}
