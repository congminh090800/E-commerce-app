import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navbar extends StatefulWidget {
  const Navbar(
      {Key? key, required this.isDrawerOpen, required this.bodyScaffoldKey})
      : super(key: key);
  final GlobalKey<ScaffoldState> bodyScaffoldKey;
  final bool isDrawerOpen;
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    widget.isDrawerOpen
        ? _animationController.forward()
        : _animationController.reverse();
    return AppBar(
      automaticallyImplyLeading: false,
      title: SizedBox(
        child: SvgPicture.asset(
          'assets/images/logo_with_text.svg',
          width: 175,
          height: 40,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
              color: Color(0xFF2F2D51),
              size: 30,
            ),
            onPressed: () {
              if (widget.isDrawerOpen) {
                Navigator.of(context).pop();
              } else {
                widget.bodyScaffoldKey.currentState?.openDrawer();
              }
            },
          ),
        ),
      ],
    );
  }
}
