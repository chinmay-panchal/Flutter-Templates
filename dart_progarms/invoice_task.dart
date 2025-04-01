import 'dart:io';

int goldPrice = 20000;
int silverPrice = 15000;
int gst = 18;
int maleDiscount = 5;
int femaleDiscount = 10;
String? purchase;
int amount = 0;

String EnterPurchase() {
  print("What do you want to purchase? 1: Gold or 2: Silver");
  String purchase = stdin.readLineSync() ?? '';

  while (purchase != '1' && purchase != '2') {
    print('invalid input please try again: ');
    purchase = stdin.readLineSync() ?? '';
  }

  return purchase;
}

int EnterAmount() {
  print("Enter Amount in Tola: ");
  amount = int.parse(stdin.readLineSync() ?? '');

  while (amount <= 0) {
    print('invalid amount, please write again: ');
    amount = int.parse(stdin.readLineSync() ?? '');
  }

  return amount;
}

void EnterGender() {
  print("enter your gender: M/F");
  String gender = stdin.readLineSync() ?? '';

  while (gender.toUpperCase() != 'M' && gender.toUpperCase() != 'F') {
    print("invalid input, enter again:");
    gender = stdin.readLineSync() ?? '';
  }

  purchase = EnterPurchase(); // gold or silver
  amount = EnterAmount();

  print("amount: ");
  printAmount(gender);
  print("gst: ");
  print(GST());
  print("Discount: ");
  printDiscount(gender);
}

void printAmount(String Gender) {
  if (Gender.toUpperCase() == 'M' && purchase == '1') {
    print(((amount *(purchase == '1'? goldPrice:silverPrice) + GST()) -
            (amount * goldPrice + GST()) * maleDiscount / 100)
        .toStringAsFixed(0));
  } else if (Gender.toUpperCase() == 'M' && purchase == '2') {
    print(((amount * silverPrice + GST()) -
            (amount * silverPrice + GST()) * maleDiscount / 100)
        .toStringAsFixed(0));
  } else if (Gender.toUpperCase() == 'F' && purchase == '1') {
    print(((amount * goldPrice + GST()) -
            (amount * goldPrice + GST()) * femaleDiscount / 100)
        .toStringAsFixed(0));
  } else {
    print(((amount * silverPrice + GST()) -
            (amount * silverPrice + GST()) * femaleDiscount / 100)
        .toStringAsFixed(0));
  }
}

double GST() {
  if (purchase == '1')
    return ((amount * goldPrice) * gst / 100);
  else {
    return ((amount * silverPrice) * gst / 100);
  }
}

void printDiscount(String Gender) {
  if (Gender.toUpperCase() == 'M' && purchase == '1') {
    (amount * goldPrice + GST()) * maleDiscount / 100;
  } else if (Gender.toUpperCase() == 'M' && purchase == '2') {
    (amount * silverPrice + GST()) * maleDiscount / 100;
  } else if (Gender.toUpperCase() == 'F' && purchase == '1') {
    (amount * goldPrice + GST()) * femaleDiscount / 100;
  } else {
    // female silver
    (amount * silverPrice + GST()) * femaleDiscount / 100;
  }
}

void main() {
  // print(femaleDiscount);

  print("enter your name");
  String name = stdin.readLineSync() ?? '';

  EnterGender();
}
