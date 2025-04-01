enum EmployeeType {
  SDE1,
  SDE2,
  HRM;
}

abstract class Employee {
  void work();

  factory Employee(EmployeeType type) {
    switch (type) {
      case EmployeeType.SDE1:
        return junior();
      case EmployeeType.SDE2:
        return senior();
      default:
        return manager();
    }
  }
}

class junior implements Employee {
  @override
  void work() {
    print("Junior Developer working");
  }
}

class senior implements Employee {
  @override
  void work() {
    print("Senior Developer Working");
  }
}

class manager implements Employee {
  @override
  void work() {
    print("Hr manager working");
  }
}

void main() {
  Employee junior = Employee(EmployeeType.SDE1);
  junior.work();
  Employee senior = FactoryMethod.getEmployee(EmployeeType.SDE2);
  senior.work();
  Employee hr = FactoryMethod.getEmployee(EmployeeType.HRM);
  hr.work();
}

class FactoryMethod{
  static Employee getEmployee(EmployeeType type) {
    switch (type) {
      case EmployeeType.SDE1:
        return junior();
      case EmployeeType.SDE2:
        return senior();
      default:
        return manager();
    }
  }
}
