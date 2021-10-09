import 'package:flutter/material.dart';

class CustomizedButton extends StatefulWidget {
  const CustomizedButton(
      {Key? key,
      this.background = Colors.white,
      this.primaryColor = const Color(0xff1890ff),
      this.btnText = "",
      this.icon,
      this.textSize = 14,
      this.borderRadius = 32,
      this.onTap})
      : super(key: key);
  final Color background;
  final Color primaryColor;
  final IconData? icon;
  final String btnText;
  final double textSize;
  final double borderRadius;
  final Function? onTap;
  @override
  _CustomizedButtonState createState() => _CustomizedButtonState();
}

class _CustomizedButtonState extends State<CustomizedButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: widget.background,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: widget.primaryColor, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        onPressed: () {
          widget.onTap!();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: widget.primaryColor,
                size: widget.icon == null ? 0 : widget.textSize,
              ),
              Text(
                " " + widget.btnText,
                style: TextStyle(
                  color: widget.primaryColor,
                  fontSize: widget.btnText == "" ? 0 : widget.textSize,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
