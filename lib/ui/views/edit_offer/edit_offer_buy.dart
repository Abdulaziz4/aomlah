import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/utils/constants.dart';
import '../../../core/models/bitcoin.dart';
import '../../../core/models/offer.dart';
import '../../shared/busy_overlay.dart';
import '../../shared/custom_card_title.dart';
import '../../shared/custom_container.dart';
import '../../shared/custom_input_field.dart';
import 'edit_offer_viewmodel.dart';

class EditBuyOfferView extends StatefulWidget {
  const EditBuyOfferView({Key? key}) : super(key: key);

  @override
  _EditBuyOfferViewState createState() => _EditBuyOfferViewState();
}

class _EditBuyOfferViewState extends State<EditBuyOfferView> {
  final _formKey = GlobalKey<FormState>();
  Offer? offer;
  double margin = 0;
  double? minTrade;
  String? currListVal;
  final TextEditingController _termsController = TextEditingController();
  final TextEditingController _minTradeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (offer == null) {
      offer ??= ModalRoute.of(context)!.settings.arguments! as Offer;
      margin = offer!.margin;
      minTrade = offer!.minTrade;
      currListVal = offer!.currencyType;
      _minTradeController.text = minTrade.toString();
      _termsController.text = offer!.terms;
    }
    double realTimePrice;
    if (offer!.currencyType == 'ر.س') {
      realTimePrice =
          Provider.of<Bitcoin>(context).price * (offer!.margin / 100) * 3.75;
    } else {
      realTimePrice =
          Provider.of<Bitcoin>(context).price * (offer!.margin / 100);
    }
    return ViewModelBuilder<EditOfferViewModel>.reactive(viewModelBuilder: () {
      return EditOfferViewModel();
    }, builder: (context, viewmodel, _) {
      return BusyOverlay(
        isBusy: viewmodel.isBusy,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Constants.black1dp,
            title: Text(
              'تعديل الاعلان',
              style: TextStyle(
                  color: Constants.darkBlue, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///Price Margin
                    CusCardTitle(title: 'نسبة هامش السعر '),

                    ///Price Margin value
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Constants.black3dp,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        leading: TextButton(
                            onPressed: () {
                              if (margin < 200) {
                                setState(() {
                                  margin++;
                                });
                              }
                            },
                            child: Text(
                              '+',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        title: Center(child: Text(margin.toString() + "%")),
                        trailing: TextButton(
                            onPressed: () {
                              if (margin > 50) {
                                setState(() {
                                  margin--;
                                });
                              }
                            },
                            child: Text(
                              '-',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ),

                    ///CryptoPrice Info
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'سعرك هو $realTimePrice $currListVal',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    ///min trade amount
                    CusCardTitle(title: 'الحد الادنى للتبادل'),

                    ///min trade amount text form
                    CustomInputField(
                      suffix: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$currListVal',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      hintText: 'ادخل الحد الادنى',
                      controller: _minTradeController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال الكمية الاجمالية';
                        } else if (double.parse(value) <= 0) {
                          return 'الرجاء ادخال كميه صحيحه';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        minTrade = double.parse(value!);
                      },
                    ),

                    ///Trade Terms and Conditions

                    CusCardTitle(title: 'الشروط والاحكام'),

                    ///Trade Terms and Conditions text form
                    CusContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _termsController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText: 'ادخل الشروط والاحكام',
                                  border: InputBorder.none),
                              keyboardType: TextInputType.text,
                              // onChanged: (value)=> setState(() => this.terms=value),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Submit Form
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.,
                      children: [
                        Expanded(
                          child: Container(
                            color: Constants.primaryColor,
                            margin: EdgeInsets.all(20),
                            child: TextButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                _formKey.currentState?.save();

                                viewmodel.editBuyOffer(offer!.offerID, margin,
                                    minTrade!, _termsController.text);
                              },
                              child: Text(
                                'تعديل',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      );
    });
  }
}
