import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/user_offer_details/components/user_trade_card.dart';
import 'package:aomlah/ui/views/user_offer_details/viewmodels/offer_trades_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class UserOfferTrades extends StatefulWidget {
  final Offer offer;
  const UserOfferTrades({Key? key, required this.offer}) : super(key: key);

  @override
  _UserOfferTradesState createState() => _UserOfferTradesState();
}

class _UserOfferTradesState extends State<UserOfferTrades> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OfferTradesViewModel>.reactive(
        viewModelBuilder: () => OfferTradesViewModel(widget.offer),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: !viewmodel.isBusy && viewmodel.trades.isEmpty
                ? buildNoResult()
                : SingleChildScrollView(
                    child: Column(
                      children: viewmodel.trades
                          .map(
                            (trade) => UserTradeCard(
                              trade: trade,
                            ),
                          )
                          .toList(),
                    ),
                  ),
          );
        });
  }

  Widget buildNoResult() {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          SvgPicture.asset("assets/icons/no-record.svg"),
          SizedBox(
            height: 10,
          ),
          Text(
            "لاتوجد تداولات",
            style: Constants.mediumText,
          )
        ],
      ),
    );
  }
}
