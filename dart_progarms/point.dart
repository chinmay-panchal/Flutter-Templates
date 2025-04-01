class Point {
  int _x = 0;
  int _y = 0;

  // Point({int x = 0, int y = 0}) {
  //   this._x = x;
  //   this._y = y;
  // }

  Point({int x = 0, int y = 0}) : _x = x, _y = y;

  show() {
    print('Point(x=$_x,y=$_y)');
  }
}

void main() {
  var p1 = Point(x: 10, y: 20);
  p1.show();
}
