void main() {
  var circle = Circle();
  circle.radius = 5;
  print(circle.radius);
}

class Circle {
  double _radius = 0;

  set radius(double value) {
    _radius = value;
  }

  double get radius {
    return _radius;
  }
}
