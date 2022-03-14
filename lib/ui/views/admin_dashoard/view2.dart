import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/app/utils/constants.dart';
import '../../shared/custom_button.dart';

class DisputeDetailWidget extends StatefulWidget {
  const DisputeDetailWidget({Key? key}) : super(key: key);

  @override
  _DisputeDetailWidgetState createState() => _DisputeDetailWidgetState();
}

class _DisputeDetailWidgetState extends State<DisputeDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("تفاصيل النزاع",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Constants.darkBlue,
              )),
          backgroundColor: Color(0xff263441),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Constants.black2dp,
          child: Container(
            width: 390,
            height: 84,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Constants.black2dp,
            ),
            child: Row(
              children: <Widget>[
                CustomButton(
                  onPressed: () {},
                  text: 'إغلاق النزاع',
                  color: Color(0xFF7BB9FA),
                  width: 340,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "رقم التداول",
                          style: Constants.mediumText.copyWith(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("0001",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  ),
                  ItemCard(
                    "اسم المنازع (البائع)",
                    "زياد",
                  ),
                  ItemCard(
                    "البريد لصحاب النزاع (البائع)",
                    "z@gmail.com",
                    copy: true,
                  ),
                  ItemCard("تنازع ضد(المشتري)", "زياد"),
                  ItemCard(
                    "البريد للمتنازع ضده (المشتري)",
                    "z@gmail.com",
                    copy: true,
                  ),
                  ItemCard("نوع التداول", "شراء BTC"),
                  ItemCard("القيمة المتنازع عليها", "0.245 BTC"),
                  Row(
                    children: [
                      Text(
                        "المحادثات",
                        style: Constants.mediumText.copyWith(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      convCard("زياد", "أهلا وسهلا"),
                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   color: Color(0xff263441),
            //   child: Center(
            //     child: InkWell(
            //       child: Container(
            //         margin: EdgeInsets.symmetric(
            //           horizontal: MediaQuery.of(context).size.width * 0.05,
            //           vertical: MediaQuery.of(context).size.height * 0.02,
            //         ),
            //         decoration: BoxDecoration(
            //           color: Color(0xFF7BB9FA),
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Center(
            //           child: Text(
            //             "إغلاق النزاع",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  ItemCard(this.label, this.data, {this.copy = false});

  String label;
  String data;
  bool copy;

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: Constants.mediumText.copyWith(
                  color: Constants.primaryColor, fontWeight: FontWeight.bold)),
          // SizedBox(width: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.data,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              Visibility(
                visible: widget.copy,
                child: InkWell(
                  child: Icon(Icons.copy, size: 18, color: Color(0xff16A79E)),
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: widget.data));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class convCard extends StatelessWidget {
  convCard(this.name, this.message);
  String name;
  String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name" + " : " + "$message",
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}
