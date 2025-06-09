import 'package:flutter/widgets.dart';

class NumberListProvider extends ChangeNotifier{
  List<int> number = [1];

  void add(){
    number.add(number.last+1);
    notifyListeners();
  }


}