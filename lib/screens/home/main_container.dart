import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMainContainer extends StatefulWidget {
  const HomeMainContainer({Key? key}) : super(key: key);

  @override
  _HomeMainContainerState createState() => _HomeMainContainerState();
}

class _HomeMainContainerState extends State<HomeMainContainer> {
  bool isDrawerOpen = false;
  switchDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Text in center',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
