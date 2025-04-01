void main() {
  greet('hey');
  greet("rahul");
  hello("gell");
}

void greet(String name, [String surname = " ", String optional = 'optional']) {
  print("Hello $name ${surname.trim()} $optional");
}

void hello(String name) {

}
