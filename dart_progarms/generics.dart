void main() {
  printData('hello');
  printData(1);

  var pair = Pair<int, String>(1, "One");
  pair.showTypes(); // Output: First: int, Second: String

  var anotherPair = Pair<double, bool>(3.14, true);
  anotherPair.showTypes(); // Output: First: double, Second: bool
}

void printData<T>(T data) {
  print(data);
}

class Pair<T, U> {
  T first;
  U second;

  Pair(this.first, this.second);

  void showTypes() {
    print('First: ${first.runtimeType}, Second: ${second.runtimeType}');
  }
}

Future<String> fun() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Hello world";
  });
}
