import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_notification/pages/home/note_button.dart';
import 'package:simple_notification/pages/home/note_text_field.dart';
import 'package:simple_notification/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("通知メモ"),
        ),
        body: Column(
          children: [
            NoteTextField(),
            NoteButton(),
          ],
        ),
      ),
    );
  }
}
