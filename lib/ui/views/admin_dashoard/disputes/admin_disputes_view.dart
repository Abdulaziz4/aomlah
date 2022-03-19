import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/admin_dashoard/disputes/components/dispute_card.dart';
import 'package:aomlah/ui/views/admin_dashoard/disputes/components/summary_card.dart';
import 'package:aomlah/ui/views/admin_dashoard/disputes/viewomodels/disputes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AdminDisputesView extends StatefulWidget {
  const AdminDisputesView({Key? key}) : super(key: key);

  @override
  _AdminDisputesViewState createState() => _AdminDisputesViewState();
}

class _AdminDisputesViewState extends State<AdminDisputesView> {
  @override
  Widget build(BuildContext context) {
    final currentPrice = Provider.of<Bitcoin>(context, listen: false).price;
    return ViewModelBuilder<DisputesViewModel>.reactive(
      viewModelBuilder: () => DisputesViewModel(),
      onModelReady: (viewmodel) => viewmodel.init(),
      builder: (context, viewmodel, _) {
        return BusyOverlay(
          isBusy: viewmodel.isBusyReport || viewmodel.isBusy,
          child: Scaffold(
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
                    items: [
                      SummaryCard(
                        amount: viewmodel.report?.tradesNum.toString() ?? "",
                        color: Constants.primaryColor,
                        icon: Icons.swap_vert_outlined,
                        label: "عدد التداولات",
                      ),
                      SummaryCard(
                        amount: viewmodel.report?.offersNum.toString() ?? "",
                        color: Color(0xFFF39C12),
                        icon: Icons.list_alt_rounded,
                        label: "عدد العروض",
                      ),
                      SummaryCard(
                        amount: viewmodel
                                .tradedValueToUsd(currentPrice)
                                .toStringAsFixed(0) +
                            " \$",
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
                if (!viewmodel.isBusy)
                  Expanded(
                    child: viewmodel.disputes.isEmpty
                        ? Text("لايوجد نزاعات")
                        : ListView(
                            children: viewmodel.disputes
                                .map((dispute) => DisputeCard(dispute: dispute))
                                .toList(),
                          ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
