import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  int noteID;
  String content;

  void changeContent(String input){
    content = input;
    notifyListeners();
  }
}