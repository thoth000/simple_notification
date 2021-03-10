import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_notification/pages/note_history/note_list.dart';
import 'package:simple_notification/provider/note_history_provider.dart';

class NoteHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteHistoryProvider(),
      child: Scaffold(
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
      ),
    );
  }
}
