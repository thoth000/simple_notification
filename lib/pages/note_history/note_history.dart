import 'package:flutter/material.dart';
import 'package:simple_notification/pages/note_history/note_list.dart';

class NoteHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "メモ一覧",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: NoteList(),
    );
  }
}
