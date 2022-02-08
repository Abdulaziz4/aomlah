import 'package:aomlah/ui/views/profile/addBankAcc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class userBankAcc extends StatelessWidget {
  const userBankAcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("الحسابات البنكية"), actions: [
          IconButton(
              onPressed: () {
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addBankAcc()));
                }
              },
              icon: SvgPicture.asset("assets/icons/addIcon.svg")),
        ]),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
              )),
              child: Row(
                children: <Widget>[
                  Container(width: 100),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.white,
                  ),
                  Text("علي سعد الشمري\n SA93 939 939 393 939 339"),
                  Spacer(flex: 3),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/Delete.svg")),
                ],
              ),
              height: 120,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ));
  }
}
