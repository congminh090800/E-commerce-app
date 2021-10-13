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

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: Column(
            children: [
              Navbar(
                isDrawerOpen: isDrawerOpen,
                bodyScaffoldKey: bodyScaffoldKey,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Scaffold(
        drawer: DrawerGuest(),
        onDrawerChanged: (isOpen) {
          handleDrawerStatus(isOpen);
        },
        key: bodyScaffoldKey,
        body: widget.screen,
      ),
    );
  }
}
