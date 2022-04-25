import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app/utils/constants.dart';
import '../../shared/custom_button.dart';

class SwapCryptocurrencyView extends StatefulWidget {
  const SwapCryptocurrencyView({Key? key}) : super(key: key);

  @override
  _SwapCryptocurrencyViewState createState() => _SwapCryptocurrencyViewState();
}

class _SwapCryptocurrencyViewState extends State<SwapCryptocurrencyView> {
  String dropdownValue = 'BTC';
  String dropdownValue2 = 'ETH';
  var items = [
    'BTC',
    'ETH',
    'USDT',
    'BNB',
    'USDC',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تبديل العملات',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Constants.black2dp,
              boxShadow: Constants.shadow,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'من',
                      style: Constants.largeText.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 10, top: 10, bottom: 5),
                  decoration: BoxDecoration(
                    color: Constants.black4dp,
                    boxShadow: Constants.shadow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Dropdown(dropdownValue),
                          Spacer(),
                          Text(
                            "1",
                            style: Constants.largeText
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "\$212.233.41",
                            style: Constants.smallText
                                .copyWith(color: Color(0xFFC6C6C6)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'إلى',
                      style: Constants.largeText.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 10, top: 10, bottom: 5),
                  decoration: BoxDecoration(
                    color: Constants.black4dp,
                    boxShadow: Constants.shadow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Dropdown(dropdownValue2),
                          Spacer(),
                          Text(
                            "14.5254009",
                            style: Constants.largeText
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            '(0.108%)',
                            style: Constants.smallText
                                .copyWith(color: Constants.primaryColor),
                          ),
                          Text(
                            "\$212.233.41",
                            style: Constants.smallText
                                .copyWith(color: Color(0xFFC6C6C6)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "1ETH = 0.07 BTC (\$2935.49)",
                      style: Constants.smallText
                          .copyWith(color: Color(0xFFC6C6C6)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomButton(
            onPressed: () {},
            text: 'تبديل',
            color: Constants.primaryColor,
            height: 38,
            width: 218,
          ),
        ],
      ),
    );
  }

  Widget Dropdown(String s) {
    return Container(
      padding: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Constants.black4dp,
        boxShadow: Constants.shadow,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          value: s,
          dropdownColor: Constants.black5dp,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Row(
                children: [
                  Text(
                    items,
                    style: Constants.largeText.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  if (items == 'BTC')
                    SvgPicture.asset("assets/icons/bitcoin_icon.svg"),
                  if (items == 'ETH')
                    SvgPicture.asset("assets/icons/ETH_icon.svg"),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              if (s == dropdownValue && newValue != dropdownValue2)
                dropdownValue = newValue!;
              else if (newValue != dropdownValue) dropdownValue2 = newValue!;
            });
          },
        ),
      ),
    );
  }
}
