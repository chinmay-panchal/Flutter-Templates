import 'dart:io';

void main() {
  int x;
  x = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  switch (x) {
    case 1:
      print('hello: ${x} is 1');
      break;

    case 2:
      print('hello 2');
      break;

    default:
      print("default");
      break;
  }
}
