import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({Key? key, required this.btnText, this.onTap})
      : super(key: key);
  final String btnText;
  final Function? onTap;
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color(0xff0071f0),
      ),
      onPressed: () {
        widget.onTap!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.btnText,
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
