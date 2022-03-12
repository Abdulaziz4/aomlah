import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/app/utils/currency_helper.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';

class TradingService {
  final _logger = getLogger("TradingService");

  final _supabaseService = locator<SupabaseService>();
  final _userService = locator<UserService>();
  final _walletManService = locator<WalletManagmentService>();

  Future<Trade> createTrade(Trade trade) async {
    _logger.i("createTrade");

    if (!trade.offer!.isBuyTrader) {
      final id = _userService.user.profileId;
      await updateDebt(id, trade.amount);
    }
    return _supabaseService.createTrade(trade);
  }

  // Checks the [newStatus] and perform the appropriate action accordingly
  Future<void> updateTradeStatus({
    required Trade trade,
    required TradeStatus newStatus,
  }) async {
    _logger.i("updateTradeStatus | newStatus=$newStatus");

    if (newStatus == TradeStatus.canceled) {
      return cancelTrade(trade);
    } else if (newStatus == TradeStatus.completed) {
      return completeTrade(trade);
    }

    return _supabaseService.changeTradeStatus(trade.tradeId, newStatus);
  }

  Future<void> completeTrade(Trade trade) async {
    late String to;
    late Wallet from;
    bool isUserMarchent = isUserMerchant(trade.traderId);
    if (isUserMarchent) {
      from = trade.offer!.ownerWallet!;
      to = trade.traderWallet!.address;
    } else {
      to = trade.offer!.ownerWallet!.address;
      from = trade.traderWallet!;
    }
    await sendTransaction(
      from: from,
      to: to,
      btcAmount: trade.amount,
    );

    if (isUserMarchent) {
      // The current user is marchent deduct from the offer owner (the user)
      await updateDebt(trade.offer!.ownerID, -1 * trade.amount);
    } else {
      // The current user is a trader deduct from the trader debt
      await updateDebt(trade.traderId, -1 * trade.amount);
    }

    // Deduct the traded quantity from the remaining quantity of the offer
    final remining = trade.offer!.remainingQuantity - trade.amount;
    await updateOfferRemainingQuantity(
      offerId: trade.offer!.offerID,
      quantity: remining,
    );

    return _supabaseService.changeTradeStatus(
      trade.tradeId,
      TradeStatus.completed,
    );
  }

  Future<void> cancelTrade(Trade trade) async {
    _logger.i("cancelTrade");

    // If the trade is a trader selling a coin revert the debte
    if (!trade.offer!.isBuyTrader) {
      updateDebt(trade.traderId, -1 * trade.amount);
    }

    _supabaseService.changeTradeStatus(trade.tradeId, TradeStatus.canceled);
  }

  // Increases/decreases user deb +value for adding -value for subtracting
  Future<void> updateDebt(String userId, double debt) async {
    _logger.i("updateDebt | args: debt = $debt");
    _supabaseService.updateUserDebt(_userService.user.profileId, debt);
  }

  Future<void> updateOfferRemainingQuantity({
    required String offerId,
    required double quantity,
  }) async {
    await _supabaseService.updateOfferRemainingQuantity(
      offerId: offerId,
      remaining: quantity,
    );
  }

  Future<void> sendTransaction({
    required Wallet from,
    required String to,
    required double btcAmount,
  }) async {
    _logger.i(
        "updateTradeStatus | args: from=${from.address} , to=$to, btcAmount=$btcAmount");

    await _walletManService.sendAndSignTransaction(
      from: from,
      to: to,
      satAmount: CurrencyHelper.btcToSat(btcAmount),
    );
  }

  bool isUserMerchant(String traderId) =>
      _userService.user.profileId != traderId;
}
