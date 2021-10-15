import 'dart:async';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key, this.color = Colors.white}) : super(key: key);
  final Color color;
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late String _timeString;
  late DateTime initDate;
  late Timer _timer;
  @override
  void initState() {
    initDate = DateTime.now();
    Duration duration = DateTime.now().difference(initDate);
    _timeString = _printDuration(duration);
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final Duration dur = now.difference(initDate);
    if (mounted) {
      setState(() {
        _timeString = _printDuration(dur);
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _timeString,
        style: TextStyle(color: widget.color),
      ),
    );
  }
}
