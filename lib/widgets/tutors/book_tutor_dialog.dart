import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/widgets/common/customized_button.dart';

class BookTutorDialog extends StatefulWidget {
  const BookTutorDialog({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  _BookTutorDialogState createState() => _BookTutorDialogState();
}

class _BookTutorDialogState extends State<BookTutorDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Table(
              border: TableBorder.all(
                color: Color(0xfff0f0f0),
                style: BorderStyle.solid,
                width: 1,
              ),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Booking Time',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffeeeaff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          DateFormat('hh:mm').format(widget.data.startTime) +
                              '-' +
                              DateFormat('hh:mm EEEE, dd MMMM y')
                                  .format(widget.data.endTime),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff7766c7),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              columnWidths: {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(7),
              },
              border: TableBorder.all(
                color: Color(0xfff0f0f0),
                style: BorderStyle.solid,
                width: 1,
              ),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Balance',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'You have 0 lesson(s) less',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff7766c7),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '1 lesson(s)',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff7766c7),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 50,
              thickness: 1,
            ),
            Table(
              border: TableBorder.all(
                color: Color(0xfff0f0f0),
                style: BorderStyle.solid,
                width: 1,
              ),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Notes',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        minLines: 5,
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              height: 50,
              thickness: 1,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomizedButton(
                    btnText: 'Cancel',
                    textSize: 20,
                    onTap: () => {
                      Navigator.pop(context),
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomizedButton(
                    btnText: 'Book',
                    icon: Icons.double_arrow,
                    background: Colors.blue,
                    primaryColor: Colors.white,
                    textSize: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
