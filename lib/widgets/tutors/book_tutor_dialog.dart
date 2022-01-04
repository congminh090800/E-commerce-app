import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/provider/locale_provider.dart';
import 'package:lettutor/real_models/price.dart';
import 'package:lettutor/real_models/user.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:provider/provider.dart';

class BookTutorDialog extends StatefulWidget {
  const BookTutorDialog({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  _BookTutorDialogState createState() => _BookTutorDialogState();
}

class _BookTutorDialogState extends State<BookTutorDialog> {
  User user = User();
  bool loading = true;
  bool priceLoading = true;
  Price price = Price();
  TextEditingController notController = TextEditingController(text: "");
  Future<void> getUserInfo() async {
    try {
      setState(() {
        loading = true;
      });
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var res = await dio.get("user/info");
      User result = User.fromJson(res.data["user"]);
      setState(() {
        user = result;
        loading = false;
      });
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> getPriceEach() async {
    try {
      setState(() {
        priceLoading = true;
      });
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var res = await dio.get("payment/price-of-session");
      Price result = Price.fromJson(res.data);
      setState(() {
        price = result;
        priceLoading = false;
      });
    } catch (e) {
      inspect(e);
    }
  }

  Future<bool> bookClass() async {
    try {
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      await dio.post(
        "booking",
        data: {
          'note': notController.text,
          'scheduleDetailIds[]': [widget.data.id],
        },
      );
      return true;
    } catch (e) {
      inspect(e);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    getPriceEach();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);
    var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: loading == true || priceLoading == true
          ? Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(),
            )
          : Container(
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
                                  i18n!.bookDialogBookingTimeHeader,
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
                                DateFormat('hh:mm')
                                        .format(widget.data.startTime) +
                                    '-' +
                                    DateFormat(
                                      'hh:mm EEEE, dd MMMM y',
                                      provider.locale.toString(),
                                    ).format(widget.data.endTime),
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
                                  i18n.bookDialogBalanceHeader,
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
                                  i18n.bookDialogBalanceContent(
                                    ((int.tryParse(user.walletInfo!.amount!) ??
                                                0) /
                                            100000)
                                        .toString(),
                                  ),
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
                                  i18n.bookDialogPriceHeader,
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
                                  i18n.bookDialogPriceContent(
                                    ((int.tryParse(price.price!) ?? 0) / 100000)
                                        .toString(),
                                  ),
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
                                  i18n.bookDialogNotesHeader,
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
                              controller: notController,
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
                          borderRadius: 5,
                          btnText: i18n.cancelBtnText,
                          textSize: 20,
                          onTap: () => {
                            Navigator.pop(context),
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomizedButton(
                          borderRadius: 5,
                          btnText: i18n.bookTutorBtnText,
                          icon: Icons.double_arrow,
                          background: Colors.blue,
                          primaryColor: Colors.white,
                          textSize: 20,
                          isDisabled:
                              ((int.tryParse(price.price!) ?? 0) / 100000) >
                                  int.tryParse(user.walletInfo!.amount!)!,
                          onTap: () async {
                            bool result = await bookClass();
                            if (result == true) {
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Book class failed, try again later",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              );
                            }
                          },
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
