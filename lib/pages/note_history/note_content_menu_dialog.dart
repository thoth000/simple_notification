import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_notification/function/notification.dart';
import 'package:simple_notification/provider/note_history_provider.dart';
import 'package:vibration/vibration.dart';

class NoteContentMenuDialog extends StatelessWidget {
  final int index;
  NoteContentMenuDialog({@required this.index});
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("メニュー"),
      children: [
        SimpleDialogItem(
          icon: Icons.notifications_none_rounded,
          color: Colors.yellow[800],
          text: "もう一度通知する",
          onPressed: () async{
            final List<String> noteData =
                Provider.of<NoteHistoryProvider>(context, listen: false)
                    .noteHistory[index];
            final String title = noteData[0];
            final String content = noteData[1];
            final int noteID = int.parse(noteData[3]);
            await Vibration.vibrate(duration: 100);
            await notificationContent(
              title: title,
              content: content,
              noteID: noteID,
            );
            Navigator.pop(context);
          },
        ),
        SimpleDialogItem(
          icon: Icons.delete,
          color: Colors.red[400],
          text: "メモを削除する",
          onPressed: () async{
            await Provider.of<NoteHistoryProvider>(context,listen: false).remove(index);
            Navigator.pop(context);
          },
        ),
        SimpleDialogItem(
          icon: Icons.arrow_back_rounded,
          color: Colors.grey,
          text: "メニューを閉じる",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem(
      {Key key, this.icon, this.color, this.text, this.onPressed})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: color),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
