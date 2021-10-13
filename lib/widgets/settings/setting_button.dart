import 'package:flutter/material.dart';

class SettingButton extends StatefulWidget {
  const SettingButton(
      {Key? key,
      this.onTap,
      required this.btnText,
      this.prefixIcon,
      this.suffixIcon,
      this.isDisabled = false,
      this.iconSize = 20,
      this.textSize = 20})
      : super(key: key);
  final Function? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String btnText;
  final bool isDisabled;
  final double iconSize;
  final double textSize;
  @override
  _SettingButtonState createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.isDisabled ? Colors.black12 : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black12,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        if (widget.isDisabled == false) {
          widget.onTap!();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: Row(
          children: [
            Icon(widget.prefixIcon,
                size: widget.prefixIcon == null ? 0 : widget.iconSize,
                color: Colors.black),
            Text(
              "  " + widget.btnText,
              style: TextStyle(
                fontSize: widget.btnText == "" ? 0 : widget.textSize,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Icon(
                    widget.suffixIcon,
                    size: widget.suffixIcon == null ? 0 : widget.iconSize,
                    color: Colors.black,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            )
          ],
        ),
      ),
    );
  }
}
