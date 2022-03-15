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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "النزاعات",
              style: Constants.largeText.copyWith(
                color: Constants.darkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                DisputeCard(),
                DisputeCard(),
                DisputeCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
