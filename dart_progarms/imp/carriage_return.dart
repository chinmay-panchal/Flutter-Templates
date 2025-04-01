import 'dart:io';

void main() async {
  for (int i = 0; i <= 100; i += 10) {
    stdout.write("\rLoading... $i%"); // Overwrites the same line
    await Future.delayed(Duration(milliseconds: 500));
  }
  print("\nDone!");

  stdout.write("hello world");
  stdout.write("\rdart");
}
