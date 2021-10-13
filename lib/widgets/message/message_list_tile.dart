import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageListTile extends StatefulWidget {
  const MessageListTile({Key? key}) : super(key: key);

  @override
  _MessageListTileState createState() => _MessageListTileState();
}

class _MessageListTileState extends State<MessageListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Khanh Uyen",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          timeago.format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Testing comment",
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
