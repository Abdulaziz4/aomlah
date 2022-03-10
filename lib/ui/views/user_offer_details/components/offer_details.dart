import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/shared/bank_account_card.dart';
import 'package:aomlah/ui/views/user_offer_details/viewmodels/user_offer_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app/utils/constants.dart';
import 'package:intl/intl.dart' as intl;

class OfferDetailsSection extends StatefulWidget {
  final Offer offer;
  const OfferDetailsSection({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  _SellingDetailsState createState() => _SellingDetailsState();
}

class _SellingDetailsState extends State<OfferDetailsSection> {
  @override
  Widget build(BuildContext context) {
    final price = Provider.of<Bitcoin>(context)
        .priceFromMargin(widget.offer.margin)
        .toStringAsFixed(3);
    return ViewModelBuilder<UserOffersDetailsViewModel>.reactive(
        viewModelBuilder: () => UserOffersDetailsViewModel(widget.offer),
        builder: (context, viewmodel, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'رقم العرض',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          Text(
                            viewmodel.offer.offerID.substring(0, 13),
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ],
                      ),
                      Text(
                        intl.DateFormat.yMMMd()
                            .add_jm()
                            .format(viewmodel.offer.createAt!),
                      ),
                    ],
                  ),
                  buildLine(),
                  buildSection(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          viewmodel.offer.isBuy
                              ? Text(
                                  " شراء ",
                                  style: Constants.smallText
                                      .copyWith(color: Constants.primaryColor),
                                )
                              : Text(
                                  'بيع ',
                                  style: TextStyle(
                                      color: Constants.redColor, fontSize: 19),
                                ),
                          Text(
                            ' BTC ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            'مقابل ر.س',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'السعر',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          Spacer(),
                          Text(
                            '$price ر.س',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'هامش السعر',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          Spacer(),
                          Text(
                            '%${viewmodel.offer.margin}',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ],
                      ),
                    ],
                  ),
                  buildLine(),
                  buildSection(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'الكمية',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          Spacer(),
                          Text(
                            ' BTC ',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          Text(
                            viewmodel.offer.cryptoAmount.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'الحد الأدنى',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          Spacer(),
                          Text(
                            '${viewmodel.offer.minTrade} ر.س',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (widget.offer.isBuy)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildLine(),
                        buildSection(
                          children: <Widget>[
                            Text(
                              'الحسابات البنكية',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                            ...viewmodel.offer.bankAccounts!
                                .map((account) => BankAccountCard(
                                      bank: account,
                                      fontSize: 16,
                                    ))
                                .toList(),
                          ],
                        ),
                      ],
                    ),
                  buildLine(),
                  buildSection(
                    children: <Widget>[
                      Text(
                        'الشروط والأحكام',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                      Text(
                        viewmodel.offer.terms,
                        style: TextStyle(color: Colors.grey, fontSize: 19),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Container buildLine() {
    return Container(
      width: double.infinity,
      height: 0.6,
      decoration: BoxDecoration(
        color: Color.fromRGBO(22, 167, 158, 1),
      ),
    );
  }

  Widget buildSection({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      ),
    );
  }
}
