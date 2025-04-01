class dog {
  String _dogtailcolor = "brown";
  void _changecolor() {
    _dogtailcolor = "black";
  }
}

abstract class germanshephard extends dog {
  String _str = '';
  // set _dogtailcolor(String __dogtailcolor) {
  //   // TODO: implement _dogtailcolor
  //   super._dogtailcolor = __dogtailcolor;
  // }
  void hello();
}

class third extends germanshephard {
  @override
  void hello() {
    _str = "";
    // TODO: implement hello
  }
}

void main() {
  var dog1 = dog();
  var gm = germanshephard();
  var thirdd = third();
  thirdd.gm._changecolor();
  // gm._dogtailcolor = "blue";
  // dog1.changecolor();
  gm._dogtailcolor = "green";
  dog1._dogtailcolor = "blue";
  print(dog1._dogtailcolor);
}
