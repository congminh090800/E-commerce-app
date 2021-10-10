import 'package:flutter/material.dart';

class TwoLinesButton extends StatefulWidget {
  const TwoLinesButton({
    Key? key,
    this.btnText = "",
    this.icon,
    this.onTap,
    this.isDisabled = false,
    this.primaryColor = const Color(0xff1890ff),
    this.textSize = 14,
  }) : super(key: key);
  final IconData? icon;
  final String btnText;
  final Function? onTap;
  final bool isDisabled;
  final Color primaryColor;
  final double textSize;
  @override
  _TwoLinesButtonState createState() => _TwoLinesButtonState();
}

class _TwoLinesButtonState extends State<TwoLinesButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (widget.isDisabled == false) {
          widget.onTap!();
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: widget.isDisabled == true
                  ? Colors.black54
                  : widget.primaryColor,
              size: widget.icon == null ? 0 : widget.textSize,
            ),
            Text(
              " " + widget.btnText,
              style: TextStyle(
                color: widget.isDisabled == true
                    ? Colors.black54
                    : widget.primaryColor,
                fontSize: widget.btnText == "" ? 0 : widget.textSize,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
