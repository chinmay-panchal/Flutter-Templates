import 'dart:io';

void main() {
  String str;
  str = stdin.readLineSync() ?? '';
  print(str);

  int? x;
  x = int.tryParse(stdin.readLineSync() ?? '');
  print(x);
}