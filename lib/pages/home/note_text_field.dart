import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_notification/provider/home_provider.dart';

class NoteTextField extends StatefulWidget {
  @override
  _NoteTextFieldState createState() => _NoteTextFieldState();
}

class _NoteTextFieldState extends State<NoteTextField> {
  TextEditingController textEditingController;

  @override
  void initState(){
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose(){
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Provider.of<HomeProvider>(context,listen: false).changeContent(input);
          //print(input);
        },
      ),
    );
  }
}
