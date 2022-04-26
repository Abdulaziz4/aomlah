import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/views/market/market_view.dart';
import 'package:aomlah/ui/views/offers_discovery/offers_discovery_view.dart';
import 'package:aomlah/ui/views/prediction/prediction_view.dart';
import 'package:aomlah/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../swap/swap_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final List<Widget> _pagesList = [
    SwapCryptocurrencyView(),
    OffersDiscoveryView(),
    PredictionView(),
    MarketView(),
    ProfileView(),
  ];

  int _selectedPage = 0; // current page index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: _pagesList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Constants.black2dp,
        iconSize: 28,
        elevation: 5,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/offers-icon.svg"),
            label: 'تبديل',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/offers-icon.svg"),
            label: 'التداول',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/prediction-icon.svg"),
            label: 'التوقعات',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/markets-icon.svg"),
            label: 'الاسواق',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/profile-icon.svg"),
            label: 'الملف الشخصي',
          ),
        ],
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
