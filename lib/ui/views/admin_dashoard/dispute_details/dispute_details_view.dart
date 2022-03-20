import 'package:aomlah/core/models/dispute.dart';
import 'package:aomlah/ui/views/admin_dashoard/dispute_details/components/dispute_section.dart';
import 'package:flutter/material.dart';
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
