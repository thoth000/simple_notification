import 'package:flutter/material.dart';
import 'package:simple_notification/pages/note_history/note_history.dart';

class CheckHistoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.history),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteHistoryPage(),
          ),
        );
      },
    );
  }
}
