import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_notification/pages/note_history/note_content.dart';
import 'package:simple_notification/provider/note_history_provider.dart';

class NoteList extends StatefulWidget {
  @override
  NoteListState createState() => NoteListState();
}

class NoteListState extends State<NoteList> {
  SharedPreferences prefs;
  int noteID;

  Future<void> getNoteHistory() async {
    List<List<String>> noteList = [];
    prefs = await SharedPreferences.getInstance();
    noteID = prefs.getInt("noteID") ?? 0;
    for (int i = noteID; i > -1; i--) {
      List<String> note = prefs.getStringList(i.toString()) ?? [];
      if (note.isNotEmpty) {
        noteList.add(note);
      }
    }
    Provider.of<NoteHistoryProvider>(context, listen: false).reload(noteList);
  }

  @override
  void initState() {
    super.initState();
    getNoteHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (
      BuildContext context,
      NoteHistoryProvider noteHistoryProvider,
      Widget child,
    ) {
      List<List<String>> noteHistory = noteHistoryProvider.noteHistory;
      if (noteHistoryProvider.hasData) {
        return ListView(
          children: List.generate(noteHistory.length, (index) {
            final noteData = noteHistory[index];
            final String title = noteData[0];
            final String content = noteData[1];
            final String timeString = noteData[2];
            return NoteContent(
              title: title,
              content: content,
              timeString: timeString,
              index: index,
            );
          }),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
