import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_notification/function/date_time_format.dart';
import 'package:simple_notification/function/notification.dart';

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  TextEditingController textEditingController;
  String content;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    content="";
    Future(() async {
      prefs = await SharedPreferences.getInstance();
    });
  }

  Future<int> saveNotification({String content}) async {
    //保存データを揃える
    DateTime noteTime = DateTime.now();
    String timeString = dateTimeFormat(noteTime);
    final int noteID = prefs.getInt("noteID")??0;
    List<String> noteData = [content, timeString, noteID.toString()];
    await prefs.setStringList(noteID.toString(), noteData);
    //次の通知に備える
    await prefs.setInt("noteID", noteID+1);
    return noteID;
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: textEditingController,
            style: TextStyle(
              fontSize: 24,
            ),
            onChanged: (input){
              content=input;
            },
          ),
        ),
        Container(
          height: 70,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () async {
              final int noteID = await saveNotification(
                content: content,
              );
              await notificationContent(
                noteID: noteID,
                content: content,
              );
              textEditingController.clear();
            },
            child: Center(
              child: Text(
                "通知する",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF505050),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
