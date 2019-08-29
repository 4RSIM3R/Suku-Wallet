import 'package:flutter/foundation.dart';

class Saldo with ChangeNotifier{
    int _currentMoney = 0;

    int get currentMoney => _currentMoney;

    set currentMoney(int newValue){
      _currentMoney = newValue;
      notifyListeners();
    }

}