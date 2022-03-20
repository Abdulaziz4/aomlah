// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:aomlah/ui/views/wallet/btc_wallet_info_view.dart';
import 'package:aomlah/ui/views/wallet/wallet_selection_view.dart';
import 'package:aomlah/ui/views/withdraw/withdraw_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../ui/views/admin_dashoard/dispute_details/dispute_details_view.dart';
import '../../ui/views/admin_dashoard/disputes/admin_disputes_view.dart';
import '../../ui/views/auth/verify_account_promotion/verify_account_promotion_view.dart';
import '../../ui/views/auth/welcome/welcome_view.dart';
import '../../ui/views/create_dispute/create_dispute_view.dart';
import '../../ui/views/create_offer/create_offer_view.dart';
import '../../ui/views/crypto_info/crypto_info_view.dart';
import '../../ui/views/faucets/faucets_view.dart';
import '../../ui/views/navigation/navigation_view.dart';
import '../../ui/views/profile/profile_view.dart';
import '../../ui/views/settings/settings_update_profile_view.dart';
import '../../ui/views/settings/settings_view.dart';
import '../../ui/views/startup/startup_view.dart';
import '../../ui/views/trading/merchant/buy_coin/merchant_buy_coin_view.dart';
import '../../ui/views/trading/merchant/sell_coin/merchant_sell_coin_view.dart';
import '../../ui/views/trading/trader/buy_coin/buy_coin_overview_view.dart';
import '../../ui/views/trading/trader/buy_coin/trader_buy_coin_view.dart';
import '../../ui/views/trading/trader/sell_coin/sell_coin_overview_view.dart';
import '../../ui/views/trading/trader/sell_coin/trader_sell_coin_view.dart';
import '../../ui/views/user_bank_accounts/user_bank_accounts_view.dart';
import '../../ui/views/user_offers/user_offers_view.dart';
import '../../ui/views/user_trades/user_trades_view.dart';
import '../../ui/views/wallet/eth_wallet_info_view.dart';
import '../../ui/views/wallet/wallet_view.dart';
import '../../ui/views/withdraw/confirm_withdraw_view.dart';
import '../../ui/views/withdraw/withdraw_view.dart';
import '../models/coin.dart';
import '../models/dispute.dart';
import '../models/offer.dart';
import '../models/trade.dart';

class Routes {
  static const String startupView = '/';
  static const String navigationView = '/navigation-view';
  static const String profileView = '/profile-view';
  static const String createOfferView = '/create-offer-view';
  static const String verifyAccountPromotionView =
      '/verify-account-promotion-view';
  static const String welcomeView = '/welcome-view';
  static const String buyCoinOverviewView = '/buy-coin-overview-view';
  static const String traderBuyCoinView = '/trader-buy-coin-view';
  static const String sellCoinOverviewView = '/sell-coin-overview-view';
  static const String traderSellCoinView = '/trader-sell-coin-view';
  static const String walletView = '/wallet-view';
  static const String walletSelectionView = '/wallet-selection-view';

  static const String faucetsView = '/faucets-view';
  static const String settingsHome = '/settings-home';
  static const String updateProfileView = '/update-profile-view';
  static const String userOffersView = '/user-offers-view';
  static const String walletInfoView = '/wallet-info-view';
  static const String userBankAccountsView = '/user-bank-accounts-view';
  static const String confirmWithdrawView = '/confirm-withdraw-view';
  static const String withdrawView = '/withdraw-view';
  static const String cryptoInfoView = '/crypto-info-view';
  static const String merchantBuyCoinView = '/merchant-buy-coin-view';
  static const String merchantSellCoinView = '/merchant-sell-coin-view';
  static const String createDisputeView = '/create-dispute-view';
  static const String userTradesView = '/user-trades-view';
  static const String btcWalletInfoView = '/btc-wallet-info-view';
  static const String ethWalletInfoView = '/eth-wallet-info-view';
  static const String adminDisputesView = '/admin-disputes-view';
  static const String disputeDetailsView = '/dispute-details-view';
  static const all = <String>{
    startupView,
    navigationView,
    profileView,
    createOfferView,
    verifyAccountPromotionView,
    welcomeView,
    buyCoinOverviewView,
    traderBuyCoinView,
    sellCoinOverviewView,
    traderSellCoinView,
    walletView,
    walletSelectionView,
    faucetsView,
    settingsHome,
    updateProfileView,
    userOffersView,
    walletInfoView,
    userBankAccountsView,
    confirmWithdrawView,
    withdrawView,
    cryptoInfoView,
    merchantBuyCoinView,
    merchantSellCoinView,
    createDisputeView,
    userTradesView,
    btcWalletInfoView,
    ethWalletInfoView,
    adminDisputesView,
    disputeDetailsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.navigationView, page: NavigationView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.createOfferView, page: CreateOfferView),
    RouteDef(Routes.verifyAccountPromotionView,
        page: VerifyAccountPromotionView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.buyCoinOverviewView, page: BuyCoinOverviewView),
    RouteDef(Routes.traderBuyCoinView, page: TraderBuyCoinView),
    RouteDef(Routes.sellCoinOverviewView, page: SellCoinOverviewView),
    RouteDef(Routes.traderSellCoinView, page: TraderSellCoinView),
    RouteDef(Routes.walletView, page: WalletView),
    RouteDef(Routes.walletSelectionView, page: WalletSelectionView),
    RouteDef(Routes.faucetsView, page: FaucetsView),
    RouteDef(Routes.settingsHome, page: SettingsHome),
    RouteDef(Routes.updateProfileView, page: UpdateProfileView),
    RouteDef(Routes.userOffersView, page: UserOffersView),
    RouteDef(Routes.userBankAccountsView, page: UserBankAccountsView),
    RouteDef(Routes.cryptoInfoView, page: CryptoInfoView),
    RouteDef(Routes.withdrawView, page: WithdrawView),
    RouteDef(Routes.confirmWithdrawView, page: ConfirmWithdrawView),
    RouteDef(Routes.confirmWithdrawView, page: ConfirmWithdrawView),
    RouteDef(Routes.withdrawView, page: WithdrawView),
    RouteDef(Routes.cryptoInfoView, page: CryptoInfoView),
    RouteDef(Routes.merchantBuyCoinView, page: MerchantBuyCoinView),
    RouteDef(Routes.merchantSellCoinView, page: MerchantSellCoinView),
    RouteDef(Routes.createDisputeView, page: CreateDisputeView),
    RouteDef(Routes.userTradesView, page: UserTradesView),
    RouteDef(Routes.btcWalletInfoView, page: BtcWalletInfoView),
    RouteDef(Routes.ethWalletInfoView, page: EthWalletInfoView),
    RouteDef(Routes.adminDisputesView, page: AdminDisputesView),
    RouteDef(Routes.disputeDetailsView, page: DisputeDetailsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    NavigationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NavigationView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    CreateOfferView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateOfferView(),
        settings: data,
      );
    },
    VerifyAccountPromotionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VerifyAccountPromotionView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WelcomeView(),
        settings: data,
      );
    },
    BuyCoinOverviewView: (data) {
      var args = data.getArgs<BuyCoinOverviewViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => BuyCoinOverviewView(
          key: args.key,
          offer: args.offer,
        ),
        settings: data,
      );
    },
    TraderBuyCoinView: (data) {
      var args = data.getArgs<TraderBuyCoinViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => TraderBuyCoinView(
          key: args.key,
          trade: args.trade,
        ),
        settings: data,
      );
    },
    SellCoinOverviewView: (data) {
      var args = data.getArgs<SellCoinOverviewViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SellCoinOverviewView(
          key: args.key,
          offer: args.offer,
        ),
        settings: data,
      );
    },
    TraderSellCoinView: (data) {
      var args = data.getArgs<TraderSellCoinViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => TraderSellCoinView(
          key: args.key,
          trade: args.trade,
        ),
        settings: data,
      );
    },
    WalletView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WalletView(),
        settings: data,
      );
    },
    FaucetsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FaucetsView(),
        settings: data,
      );
    },
    SettingsHome: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SettingsHome(),
        settings: data,
      );
    },
    UpdateProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UpdateProfileView(),
        settings: data,
      );
    },
    UserOffersView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserOffersView(),
        settings: data,
      );
    },
    // WalletInfoView: (data) {
    //   return MaterialPageRoute<dynamic>(
    //     builder: (context) => const WalletInfoView(),
    //     settings: data,
    //   );
    // },
    UserBankAccountsView: (data) {
      var args = data.getArgs<UserBankAccountsViewArguments>(
        orElse: () => UserBankAccountsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserBankAccountsView(
          key: args.key,
          allowSelection: args.allowSelection,
        ),
        settings: data,
      );
    },
    ConfirmWithdrawView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ConfirmWithdrawView(),
        settings: data,
      );
    },
    WithdrawView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WithdrawView(),
        settings: data,
      );
    },
    CryptoInfoView: (data) {
      var args = data.getArgs<CryptoInfoViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CryptoInfoView(
          key: args.key,
          coin: args.coin,
        ),
        settings: data,
      );
    },
    MerchantBuyCoinView: (data) {
      var args = data.getArgs<MerchantBuyCoinViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => MerchantBuyCoinView(
          key: args.key,
          trade: args.trade,
        ),
        settings: data,
      );
    },
    MerchantSellCoinView: (data) {
      var args = data.getArgs<MerchantSellCoinViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => MerchantSellCoinView(
          key: args.key,
          trade: args.trade,
        ),
        settings: data,
      );
    },
    CreateDisputeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateDisputeView(),
        settings: data,
      );
    },
    UserTradesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserTradesView(),
        settings: data,
      );
    },
    WalletSelectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WalletSelectionView(),
        settings: data,
      );
    },
    BtcWalletInfoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const BtcWalletInfoView(),
        settings: data,
      );
    },
    EthWalletInfoView: (data) {
      return MaterialPageRoute<dynamic>(
          builder: (context) => const EthWalletInfoView(), settings: data);
    },
    AdminDisputesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AdminDisputesView(),
        settings: data,
      );
    },
    DisputeDetailsView: (data) {
      var args = data.getArgs<DisputeDetailsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => DisputeDetailsView(
          key: args.key,
          dispute: args.dispute,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// BuyCoinOverviewView arguments holder class
class BuyCoinOverviewViewArguments {
  final Key? key;
  final Offer offer;
  BuyCoinOverviewViewArguments({this.key, required this.offer});
}

/// TraderBuyCoinView arguments holder class
class TraderBuyCoinViewArguments {
  final Key? key;
  final Trade trade;
  TraderBuyCoinViewArguments({this.key, required this.trade});
}

/// SellCoinOverviewView arguments holder class
class SellCoinOverviewViewArguments {
  final Key? key;
  final Offer offer;
  SellCoinOverviewViewArguments({this.key, required this.offer});
}

/// TraderSellCoinView arguments holder class
class TraderSellCoinViewArguments {
  final Key? key;
  final Trade trade;
  TraderSellCoinViewArguments({this.key, required this.trade});
}

/// UserBankAccountsView arguments holder class
class UserBankAccountsViewArguments {
  final Key? key;
  final bool allowSelection;
  UserBankAccountsViewArguments({this.key, this.allowSelection = false});
}

/// CryptoInfoView arguments holder class
class CryptoInfoViewArguments {
  final Key? key;
  final Coin coin;
  CryptoInfoViewArguments({this.key, required this.coin});
}

/// MerchantBuyCoinView arguments holder class
class MerchantBuyCoinViewArguments {
  final Key? key;
  final Trade trade;
  MerchantBuyCoinViewArguments({this.key, required this.trade});
}

/// MerchantSellCoinView arguments holder class
class MerchantSellCoinViewArguments {
  final Key? key;
  final Trade trade;
  MerchantSellCoinViewArguments({this.key, required this.trade});
}

/// DisputeDetailsView arguments holder class
class DisputeDetailsViewArguments {
  final Key? key;
  final Dispute dispute;
  DisputeDetailsViewArguments({this.key, required this.dispute});
}
