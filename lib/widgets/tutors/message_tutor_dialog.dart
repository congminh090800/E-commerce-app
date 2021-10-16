import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageTutorDialog extends StatefulWidget {
  const MessageTutorDialog({Key? key}) : super(key: key);

  @override
  _MessageTutorDialogState createState() => _MessageTutorDialogState();
}

class _MessageTutorDialogState extends State<MessageTutorDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(width: 1),
                ),
                hintText: 'Aa',
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
