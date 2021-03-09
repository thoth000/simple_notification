import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_notification/provider/home_provider.dart';

class NoteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, HomeProvider value, Widget child) {
        return Container(
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
            onTap: () {},
            child: Center(
              child: Text(
                "通知する",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF505050),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
