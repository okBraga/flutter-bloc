import 'package:flutter/cupertino.dart';

class MainController {
  ValueNotifier<int> counterVn = ValueNotifier(0);

  void adicionar(){
    counterVn.value += 1;
  }
}
