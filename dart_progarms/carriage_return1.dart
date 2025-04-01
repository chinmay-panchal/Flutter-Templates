import 'dart:io';

void main() async {
  String text = "Typing effect";
  for (int i = 0; i < text.length; i++) {
    stdout.write("\r" + text.substring(0, i + 1)); 
    await Future.delayed(Duration(milliseconds: 200));
  }
  print(""); // Moves to a new line
}
