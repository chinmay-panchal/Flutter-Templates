mixin Flyable {
  void fly() => print("Flying...");
}

mixin Swimmable {
  void swim() => print("Swimming...");
}

class Duck with Flyable, Swimmable {}

void main() {
  var duck = Duck();
  duck.fly();   // Output: Flying...
  duck.swim();  // Output: Swimming...
}