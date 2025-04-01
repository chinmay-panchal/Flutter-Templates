class Circle {
  double _radius = 0;
  
  get area => radius * radius * 3.14;

  Circle(double radius) {
    if (radius >= 0) {
      _radius = radius;
    }
  }

  set radius(double value) {
    _radius = value;
    // print(_radius);
  }

  double get radius {
    return _radius;
  }
}
