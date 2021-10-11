import 'package:flutter/material.dart';

class CustomizedButton extends StatefulWidget {
  const CustomizedButton({
    Key? key,
    this.background = Colors.white,
    this.primaryColor = const Color(0xff1890ff),
    this.btnText = "",
    this.icon,
    this.textSize = 14,
    this.borderRadius = 32,
    this.onTap,
    this.isDisabled = false,
    this.verticalPadding = 4,
    this.horizontalPadding = 16,
    this.hasBorder = true,
  }) : super(key: key);
  final Color background;
  final Color primaryColor;
  final IconData? icon;
  final String btnText;
  final double textSize;
  final double borderRadius;
  final Function? onTap;
  final bool isDisabled;
  final double horizontalPadding;
  final double verticalPadding;
  final bool hasBorder;
  @override
  _CustomizedButtonState createState() => _CustomizedButtonState();
}

class _CustomizedButtonState extends State<CustomizedButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.isDisabled ? Colors.black12 : widget.background,
        shape: widget.hasBorder == false
            ? null
            : RoundedRectangleBorder(
                side: BorderSide(
                    color: widget.isDisabled == true
                        ? Colors.white24
                        : widget.primaryColor,
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
      ),
      onPressed: () {
        if (widget.isDisabled == false) {
          widget.onTap!();
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
            widget.horizontalPadding,
            widget.verticalPadding,
            widget.horizontalPadding,
            widget.verticalPadding),
        child: Row(
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
