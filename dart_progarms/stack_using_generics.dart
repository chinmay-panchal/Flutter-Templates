void main() {
  var stack = Stack<int>();
  var st = Stack<dynamic>();
  stack.push(5);
  stack.push(4);
  stack.push(3);
  stack.pop();
  stack.display();
}

class Stack<T> {
  List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (_items.isEmpty) {
      throw Exception("Stack is empty");
    }
    return _items.removeLast();
  }

  T peek() {
    if (_items.isEmpty) {
      throw Exception("Stack is empty");
    }
    return _items.last;
  }

  bool get isempty {
    return _items.isEmpty;
  }

  void display() {
    print("Stack: $_items");
  }
}
