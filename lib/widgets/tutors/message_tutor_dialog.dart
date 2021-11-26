import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageTutorDialog extends StatefulWidget {
  const MessageTutorDialog({Key? key}) : super(key: key);

  @override
  _MessageTutorDialogState createState() => _MessageTutorDialogState();
}

class _MessageTutorDialogState extends State<MessageTutorDialog> {
  List<String> messages = [];
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: ListView(
              shrinkWrap: true,
              children: messages
                  .map(
                    (mess) => Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: DecoratedBox(
                                child: Text(
                                  " " + mess + " ",
                                  maxLines: 20,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      height: 2),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        )),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: messageController,
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
                  onTap: () {
                    setState(() {
                      messages.add(messageController.text);
                      messageController.clear();
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
