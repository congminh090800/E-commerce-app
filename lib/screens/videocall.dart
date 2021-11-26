import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/widgets/common/clock.dart';

class VideoCallRoom extends StatefulWidget {
  const VideoCallRoom({Key? key, this.startTimeStamp = 0}) : super(key: key);
  final int startTimeStamp;
  @override
  _VideoCallRoomState createState() => _VideoCallRoomState();
}

class _VideoCallRoomState extends State<VideoCallRoom> {
  bool muted = false;
  bool camOff = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 50,
        color: Colors.black.withOpacity(0.8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: SizedBox(
                    child: Container(
                      color: Colors.grey,
                      child: Icon(
                        muted ? Icons.mic_off : Icons.mic,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    width: 40,
                    height: 40,
                  ),
                  onTap: () {
                    setState(() {
                      muted = !muted;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: SizedBox(
                    child: Container(
                      color: Colors.grey,
                      child: Icon(
                        camOff ? Icons.videocam_off : Icons.videocam,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    width: 40,
                    height: 40,
                  ),
                  onTap: () {
                    setState(() {
                      camOff = !camOff;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: SizedBox(
                    child: Container(
                      color: Colors.red,
                      child: Icon(
                        Icons.call_end,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    width: 40,
                    height: 40,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/logo_with_text.svg',
                            width: 100,
                            height: 30,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.black.withOpacity(0.5),
                          margin: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                "Tutoring meeting room",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Clock(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.black.withOpacity(0.5),
                            alignment: Alignment.center,
                            width: 200,
                            child: Text(
                              'Lesson start in: ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                            alignment: Alignment.center,
                            width: 200,
                            child: CountdownTimer(
                              endTime: widget.startTimeStamp,
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
