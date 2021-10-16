import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/screens/courses/index.dart';
import 'package:lettutor/screens/message.dart';
import 'package:lettutor/screens/schedule.dart';
import 'package:lettutor/screens/settings.dart';
import 'package:lettutor/screens/tutors/index.dart';
import 'package:lettutor/screens/tutors/search_tutor.dart';
import 'package:lettutor/widgets/common/header/no_drawer_navbar.dart';

class NoDrawerHeader extends StatefulWidget {
  const NoDrawerHeader({Key? key}) : super(key: key);

  @override
  _NoDrawerHeaderState createState() => _NoDrawerHeaderState();
}

class _NoDrawerHeaderState extends State<NoDrawerHeader> {
  final screens = [
    TutorsPage(),
    MessagePage(),
    SchedulePage(),
    SearchTutorPage(),
    CoursesPage(),
    SettingsPage(),
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: Column(
            children: [
              NoDrawerNavbar(),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: screens[current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: current,
        onTap: (int index) {
          setState(() {
            current = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: i18n!.homeBottomNavItem,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: i18n.messageBottomNavItem,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: i18n.upcomingBottomNavItem,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: i18n.tutorsBottomNavItem,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: i18n.courseViewSearchPlaceholder,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: i18n.settingsBottomNavItem,
          ),
        ],
      ),
    );
  }
}
