import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoDrawerNavbar extends StatefulWidget {
  const NoDrawerNavbar({Key? key}) : super(key: key);

  @override
  _NoDrawerNavbarState createState() => _NoDrawerNavbarState();
}

class _NoDrawerNavbarState extends State<NoDrawerNavbar> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
