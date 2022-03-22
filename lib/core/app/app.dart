import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/core/services/candles_service.dart';
import 'package:aomlah/core/services/crypto_info_service.dart';
import 'package:aomlah/core/services/eth_price_service.dart';
import 'package:aomlah/core/services/eth_wallet_managment_service.dart';
import 'package:aomlah/core/services/offers_service.dart';
import 'package:aomlah/core/services/realtime_wallet_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/trading_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';
import 'package:aomlah/ui/views/admin_dashoard/dispute_details/dispute_details_view.dart';
import 'package:aomlah/ui/views/admin_dashoard/disputes/admin_disputes_view.dart';
import 'package:aomlah/ui/views/auth/verify_account_promotion/verify_account_promotion_view.dart';
import 'package:aomlah/ui/views/auth/welcome/welcome_view.dart';
import 'package:aomlah/ui/views/chat/chat_view.dart';
import 'package:aomlah/ui/views/create_dispute/create_dispute_view.dart';
import 'package:aomlah/ui/views/create_offer/create_offer_view.dart';
import 'package:aomlah/ui/views/crypto_info/crypto_info_view.dart';
import 'package:aomlah/ui/views/faucets/faucets_view.dart';
import 'package:aomlah/ui/views/navigation/navigation_view.dart';
import 'package:aomlah/ui/views/profile/profile_view.dart';
import 'package:aomlah/ui/views/settings/settings_update_profile_view.dart';
import 'package:aomlah/ui/views/settings/settings_view.dart';
import 'package:aomlah/ui/views/startup/startup_view.dart';
import 'package:aomlah/ui/views/trading/merchant/buy_coin/merchant_buy_coin_view.dart';
import 'package:aomlah/ui/views/trading/merchant/sell_coin/merchant_sell_coin_view.dart';
import 'package:aomlah/ui/views/trading/trader/buy_coin/buy_coin_overview_view.dart';
import 'package:aomlah/ui/views/trading/trader/buy_coin/trader_buy_coin_view.dart';
import 'package:aomlah/ui/views/trading/trader/sell_coin/sell_coin_overview_view.dart';
import 'package:aomlah/ui/views/trading/trader/sell_coin/trader_sell_coin_view.dart';
import 'package:aomlah/ui/views/user_bank_accounts/user_bank_accounts_view.dart';
import 'package:aomlah/ui/views/user_offers/user_offers_view.dart';
import 'package:aomlah/ui/views/user_trades/user_trades_view.dart';
import 'package:aomlah/ui/views/wallet/btc_wallet_info_view.dart';
import 'package:aomlah/ui/views/wallet/eth_wallet_info_view.dart';
import 'package:aomlah/ui/views/wallet/wallet_selection_view.dart';
import 'package:aomlah/ui/views/wallet/wallet_view.dart';
import 'package:aomlah/ui/views/withdraw/confirm_withdraw_view.dart';
import 'package:aomlah/ui/views/withdraw/withdraw_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/btc_price_service.dart';
import '../services/realtime_eth_wallet_service.dart';

@StackedApp(
  routes: [
    // Register all views
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: NavigationView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: CreateOfferView),
    MaterialRoute(page: VerifyAccountPromotionView),
    MaterialRoute(page: WelcomeView),
    MaterialRoute(page: BuyCoinOverviewView),
    MaterialRoute(page: TraderBuyCoinView),
    MaterialRoute(page: SellCoinOverviewView),
    MaterialRoute(page: TraderSellCoinView),
    MaterialRoute(page: WalletView),
    MaterialRoute(page: FaucetsView),
    MaterialRoute(page: SettingsHome),
    MaterialRoute(page: UpdateProfileView),
    MaterialRoute(page: UserOffersView),
    MaterialRoute(page: UserBankAccountsView),
    MaterialRoute(page: ConfirmWithdrawView),
    MaterialRoute(page: WithdrawView),
    MaterialRoute(page: CryptoInfoView),
    MaterialRoute(page: MerchantBuyCoinView),
    MaterialRoute(page: MerchantSellCoinView),
    MaterialRoute(page: CreateDisputeView),
    MaterialRoute(page: UserTradesView),
    MaterialRoute(page: BtcWalletInfoView),
    MaterialRoute(page: EthWalletInfoView),
    MaterialRoute(page: AdminDisputesView),
    MaterialRoute(page: DisputeDetailsView),
    MaterialRoute(page: ChatView),
    MaterialRoute(page: WalletSelectionView),
  ],
  dependencies: [
    // Register all services and deps.
    LazySingleton<NavigationService>(classType: NavigationService),
    LazySingleton<WalletManagmentService>(classType: WalletManagmentService),
    LazySingleton<WalletManagmentService>(classType: EthWalletManagmentService),

    LazySingleton<AuthService>(classType: AuthService),
    LazySingleton<UserService>(classType: UserService),
    LazySingleton<BtcPriceService>(classType: BtcPriceService),
    LazySingleton<EthPriceService>(classType: EthPriceService),

    LazySingleton<CryptoInfoService>(classType: CryptoInfoService),
    LazySingleton<RealtimeWalletService>(classType: RealtimeWalletService),
    LazySingleton<RealtimeEthWalletService>(
        classType: RealtimeEthWalletService),
    LazySingleton<CandlesService>(classType: CandlesService),
    LazySingleton<TradingService>(classType: TradingService),
    LazySingleton<OffersService>(classType: OffersService),
    LazySingleton<SnackbarService>(classType: SnackbarService),

    Presolve(
      classType: SupabaseService,
      presolveUsing: SupabaseService.getInstance,
    ),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
