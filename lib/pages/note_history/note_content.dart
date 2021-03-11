import 'package:flutter/material.dart';
import 'package:simple_notification/pages/note_history/note_content_menu_dialog.dart';

class NoteContent extends StatelessWidget {
  final String title;
  final String content;
  final String timeString;
  final int index;
  NoteContent({
    @required this.title,
    @required this.content,
    @required this.timeString,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context)=>NoteContentMenuDialog(index: index,),);
        //Provider.of<NoteHistoryProvider>(context, listen: false).remove(index);
      },
      child: Container(
        padding: EdgeInsets.all(15),
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
                fontSize: 14,
                color: Color(0xFF707070),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF303030),
              ),
            ),
            Text(
              content,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF505050),
              ),
            )
          ],
        ),
      ),
    );
  }
}
