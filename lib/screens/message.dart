import 'package:flutter/material.dart';
import 'package:lettutor/widgets/message/message_list_tile.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
            MessageListTile(),
          ],
        ),
      ),
    );
  }
}
