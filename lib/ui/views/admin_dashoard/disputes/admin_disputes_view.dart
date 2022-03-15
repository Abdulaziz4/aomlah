import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/views/admin_dashoard/disputes/components/dispute_card.dart';
import 'package:aomlah/ui/views/admin_dashoard/disputes/components/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdminDisputesView extends StatefulWidget {
  const AdminDisputesView({Key? key}) : super(key: key);

  @override
  _AdminDisputesViewState createState() => _AdminDisputesViewState();
}

class _AdminDisputesViewState extends State<AdminDisputesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("لوحة التحكم"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                viewportFraction: 0.8,
              ),
              items: const [
                SummaryCard(
                  amount: "33392",
                  color: Constants.primaryColor,
                  icon: Icons.swap_vert_outlined,
                  label: "عدد التداولات",
                ),
                SummaryCard(
                  amount: "33392",
                  color: Color(0xFFF39C12),
                  icon: Icons.list_alt_rounded,
                  label: "عدد العروض",
                ),
                SummaryCard(
                  amount: "346.232,235 \$",
                  color: Color(0xFFBB6BD9),
                  icon: Icons.currency_exchange,
                  label: "قيمة التداولات",
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "النزاعات",
                    style: Constants.largeText.copyWith(
                      color: Constants.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              /// You have to change the column to listView.builder to get the data and put it in card from the database.
              /// Wrong: sorry my language is very bad .
              child: Column(
                children: const [
                  DisputeCard(),
                  DisputeCard(),
                  DisputeCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

///  هذه هي كرتة النزاعات، قم بتعديلها كيفما تشاء .
