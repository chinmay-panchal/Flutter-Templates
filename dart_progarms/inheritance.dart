class BankAcount {
  double _balance = 0;

  double get balance => _balance;

  deposit(double amount) {
    _balance += amount;
  }

  bool withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }
}

class SavingAccount extends BankAcount {
  double _interestRate = 0;

  double get interestRate => _interestRate;

  set interestRate(double value) {
    if (value > 0) {
      _interestRate = value;
    }
  }

  addInterest() {
    double interest = _balance * _interestRate;
    _balance += interest;
  }
}

void main() {
  var account = SavingAccount();
  account.deposit(1000);

  account.interestRate = 0.05;
  account.addInterest();

  var account2 = SavingAccount();

  account2.deposit(1000);
  account2.interestRate = 0.05;
  account2.addInterest();

  account2._balance = 0;

  print(account.balance);
  print(account2.balance);
}
