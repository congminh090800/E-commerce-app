import 'package:flutter/material.dart';

class FullScreenDialog extends StatefulWidget {
  const FullScreenDialog({Key? key, this.content, this.title = ""})
      : super(key: key);
  final Widget? content;
  final String title;
  @override
  _FullScreenDialogState createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(widget.title),
      ),
      body: Center(
        child: widget.content,
      ),
    );
  }
}
