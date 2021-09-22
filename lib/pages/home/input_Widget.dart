import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_notification/function/date_time_format.dart';
import 'package:simple_notification/function/notification.dart';

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  TextEditingController contentEditingController;
  TextEditingController titleEditingController;
  String content;
  String title;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    contentEditingController = TextEditingController();
    titleEditingController = TextEditingController(text: "");
    content = "";
    title = "";
    Future(() async {
      prefs = await SharedPreferences.getInstance();
    });
  }

  Future<int> saveNotification({String title, String content}) async {
    //保存データを揃える
    DateTime noteTime = DateTime.now();
    String timeString = dateTimeFormat(noteTime);
    final int noteID = prefs.getInt("noteID") ?? 0;
    List<String> noteData = [title, content, timeString, noteID.toString()];
    await prefs.setStringList(noteID.toString(), noteData);
    //次の通知に備える
    await prefs.setInt("noteID", noteID + 1);
    return noteID;
  }

  @override
  void dispose() {
    super.dispose();
    contentEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              TextField(
                controller: titleEditingController,
                decoration: InputDecoration(
                  hintText: "タイトル",
                  hintStyle: TextStyle(
                    color: Color(0xFFA0A0A0),
                  ),
                ),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (input) {
                  title = input;
                },
                onTap: (){
                  titleEditingController.clear();
                  title="";
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "通知内容",
                  hintStyle: TextStyle(
                    color: Color(0xFFA0A0A0),
                  ),
                ),
                minLines: 1,
                maxLines: 10,
                controller: contentEditingController,
                style: TextStyle(
                  fontSize: 20,
                ),
                onChanged: (input) {
                  content = input;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: (){
                        title="";
                        content="";
                        titleEditingController.clear();
                        contentEditingController.clear();
                        FocusScope.of(context).unfocus();
                      },
                      radius: 10,
                      child: Center(
                        child: Text(
                          " 書き込み消去 ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: (){
                        FocusScope.of(context).unfocus();
                      },
                      radius: 10,
                      child: Center(
                        child: Text(
                          " 書き込み完了 ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              final int noteID = await saveNotification(
                title: title,
                content: content,
              );
              await notificationContent(
                title: title,
                content: content,
                noteID: noteID,
              );
              contentEditingController.clear();
              titleEditingController.clear();
            },
            child: Center(
              child: Text(
                "通知する",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF505050),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              await saveNotification(
                title: title,
                content: content,
              );
              contentEditingController.clear();
              titleEditingController.clear();
            },
            child: Center(
              child: Text(
                "通知せずメモする",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF707070),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
