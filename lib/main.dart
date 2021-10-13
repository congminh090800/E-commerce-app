import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/screens/home.dart';
import 'package:lettutor/widgets/common/boiler_plate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BoilerPlate(page: HomePage());
  }
}
