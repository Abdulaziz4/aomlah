import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/user_offers/viewmodels/user_offers_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app/utils/constants.dart';
import 'components/user_offers_card.dart';

class UserOffersView extends StatelessWidget {
  const UserOffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserOfferViewModel>.reactive(
      viewModelBuilder: () => UserOfferViewModel(),
      onModelReady: (viewmodel) => viewmodel.listenToOffers(),
      builder: (context, viewmodel, _) => DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'عروضي',
                  style: Constants.largeText.copyWith(
                      color: Constants.darkBlue, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text('شراء', style: Constants.smallText),
                    ),
                    Tab(
                      child: Text('بيع', style: Constants.smallText),
                    ),
                  ],
                ),
              ),
              body: BusyOverlay(
                isBusy: viewmodel.isBusy,
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          viewmodel.buyOffers.isEmpty && !viewmodel.isBusy
                              ? buildNoResult()
                              : Column(
                                  children: viewmodel.buyOffers
                                      .map(
                                        (offer) => UserOffersCard(
                                          offer: offer,
                                        ),
                                      )
                                      .toList(),
                                ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          viewmodel.sellOffers.isEmpty && !viewmodel.isBusy
                              ? buildNoResult()
                              : Column(
                                  children: viewmodel.sellOffers
                                      .map(
                                        (offer) => UserOffersCard(
                                          offer: offer,
                                        ),
                                      )
                                      .toList(),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
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
            "لاتوجد عروض",
            style: Constants.mediumText,
          )
        ],
      ),
    );
  }
}
