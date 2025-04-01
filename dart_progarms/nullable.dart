bool? isTextFile(String? filename) {
  if (filename != null) {
    return filename.endsWith('.txt') ? true : false;
  }
  return null;
}

void main() {
  bool result = isTextFile('readme.txt')??false;
  print(result);
}
