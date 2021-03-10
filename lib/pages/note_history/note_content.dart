import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_notification/provider/note_history_provider.dart';

class NoteContent extends StatelessWidget {
  final String content;
  final String timeString;
  final int index;
  NoteContent({
    @required this.content,
    @required this.timeString,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<NoteHistoryProvider>(context, listen: false).remove(index);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: const Color(0xFFA0A0A0),
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              timeString,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF707070),
              ),
            ),
            Text(
              content,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF505050),
              ),
            )
          ],
        ),
      ),
    );
  }
}
