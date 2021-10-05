import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer_guest.dart';
import 'navbar.dart';

class Header extends StatefulWidget {
  const Header({Key? key, required this.screen}) : super(key: key);
  final Widget screen;
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var bodyScaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrawerOpen = false;
  handleDrawerStatus(bool newStatus) {
    setState(() {
      isDrawerOpen = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Column(
          children: [
            Navbar(isDrawerOpen: isDrawerOpen, bodyScaffoldKey: bodyScaffoldKey)
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        preferredSize: Size.fromHeight(70),
      ),
      body: Scaffold(
        key: bodyScaffoldKey,
        drawer: DrawerGuest(),
        onDrawerChanged: (isOpen) {
          handleDrawerStatus(isOpen);
        },
        body: widget.screen,
      ),
    );
  }
}
