import 'dart:async';

Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Data loaded!";
  });
}

Future<int> delayint() {
  return Future.delayed(Duration(milliseconds: 10), () {
    return 1;
  });
}

// void main() {
//   print("Fetching data...");
//   fetchData().then((data) => print(data));
//   delayint().then((d) => print(d));
//   print("Other operations...");
// }

Future<String> orderPizza() {
  return Future.delayed(Duration(seconds: 3), () {
    return "🍕 Pizza is ready!";
  });
}

Stream<void> main() async* {
  // print("Ordering pizza...");
  // orderPizza().then((pizza) {
  //   print(pizza); // Prints after 3 seconds
  // });
  // print("Waiting for the pizza...");

  print("clicked on find");
  String captain = await rapido();
  print(captain);
  print("here are our captains: \nRaju\nMukesh");
  // rapido().then((value) {
  //   print(value);
  // });
}

Future<String> rapido() {
  return Future.delayed(Duration(seconds: 2), () {
    return ("finding the captains....");
  });
}

// Await se kya hoga ki await agar exist karta h toh function ko async banao 
// await se code jabtak woh implement nahi hota age nahi badhega
// .then se kya hoga ki aage ka implement hojayega