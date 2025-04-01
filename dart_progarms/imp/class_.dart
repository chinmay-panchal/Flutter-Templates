// by returning the current object this, it allows method chaining

class Point {
  int x = 0;
  int y = 0;

  Point move(int x, int y) {
    this.x = x;
    this.y = y;
    return this;
  }

  Point reset() {
    this.x = 30;
    this.y = 40;
    return this;
  }

  Point show() {
    print('Point($x,$y)');
    return this;
  }
}

void main() {
  var p1 = Point();
  p1.move(10, 20).reset().show();
  // p1.show();
}
