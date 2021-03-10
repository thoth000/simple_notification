import 'package:flutter/material.dart';
import 'package:simple_notification/pages/home/check_history_button.dart';
import 'package:simple_notification/pages/home/input_Widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "通知メモ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CheckHistoryButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: InputWidget(),
      ),
    );
  }
}
