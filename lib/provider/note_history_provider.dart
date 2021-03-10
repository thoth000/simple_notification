import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteHistoryProvider extends ChangeNotifier{
  List<List<String>> noteHistory;
  bool hasData=false;

  void reload(List<List<String>> _noteHistory){
    noteHistory = _noteHistory;
    hasData=true;
    notifyListeners();
  }

  Future<void> remove(int index) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> noteData = noteHistory[index];
    await prefs.remove(noteData[2]);
    noteHistory.removeAt(index);
    notifyListeners();
  }
}