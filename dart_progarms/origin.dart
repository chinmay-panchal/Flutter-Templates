class Point {
  int x = 0;
  int y = 0;

  Point({this.x = 0, this.y = 0});

  Point.origin() : this(x: 0, y: 0);
}

void main() {
  var p1 = Point(x: 10, y: 20);
  print(p1.x);
}
