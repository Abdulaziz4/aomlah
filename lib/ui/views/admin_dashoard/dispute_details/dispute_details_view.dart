import 'package:aomlah/core/models/dispute.dart';
import 'package:aomlah/ui/views/admin_dashoard/dispute_details/components/dispute_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/app/utils/constants.dart';
import '../../../shared/custom_button.dart';

class DisputeDetailsView extends StatefulWidget {
  final Dispute dispute;
  const DisputeDetailsView({Key? key, required this.dispute}) : super(key: key);

  @override
  _DisputeDetailsViewState createState() => _DisputeDetailsViewState();
}

class _DisputeDetailsViewState extends State<DisputeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("تفاصيل النزاع"),
        ),
        bottomNavigationBar: buildBottomButtom(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisputeSection(
                    title: "رقم التداول",
                    content: Text(
                      "1289412874187",
                      style: Constants.smallText,
                    ),
                  ),
                  DisputeSection(
                    title: "اسم المنازع (البائع)",
                    content: Text(
                      "1289412874187",
                      style: Constants.smallText,
                    ),
                  ),
                  DisputeSection(
                    title: "البريد لصاحب النزاع (البائع)",
                    content: Text(
                      "zawer@gmail.com",
                      style: Constants.smallText,
                    ),
                  ),
                  DisputeSection(
                    content: Text(
                      "زياد",
                      style: Constants.smallText,
                    ),
                    title: "تنازع ضد (المشتري)",
                  ),
                  DisputeSection(
                    content: Text(
                      "asddklna@gmail.com",
                      style: Constants.smallText,
                    ),
                    title: "البريد للمتنازع ضده (المشتري)",
                  ),
                  DisputeSection(
                    title: "نوع التداول",
                    content: Text(
                      "شراء BTC",
                      style: Constants.smallText,
                    ),
                  ),
                  DisputeSection(
                    title: "الكمية المتنازع عليها",
                    content: Text(
                      "0.0232 BTC",
                      style: Constants.smallText,
                    ),
                  ),
                  DisputeSection(
                    title: "المحادثات",
                    content: Text(
                      "0.0232 BTC",
                      style: Constants.smallText,
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

  BottomAppBar buildBottomButtom() {
    return BottomAppBar(
      color: Constants.black2dp,
      child: Container(
        height: 84,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Constants.black2dp,
        ),
        child: CustomButton(
          onPressed: () {},
          text: 'إغلاق النزاع',
          color: Color(0xFF7BB9FA),
          height: 45,
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
