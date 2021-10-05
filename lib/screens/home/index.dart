import 'package:flutter/cupertino.dart';
import 'package:lettutor/screens/home/main_container.dart';
import 'package:lettutor/widgets/common/header/index.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeMainContainer _homeMainContainer = HomeMainContainer();
    return Header(screen: _homeMainContainer);
  }
}
