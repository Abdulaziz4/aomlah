import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/dispute_status.dart';
import 'package:aomlah/core/enums/trade_status.dart';
import 'package:aomlah/core/models/chat_message.dart';

import 'package:aomlah/core/models/dispute.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:stacked/stacked.dart';

class DisputeDetailsViewModel extends StreamViewModel<List<Dispute>> {
  final _logger = getLogger("DisputeDetailsViewModel");

  final _supabaseService = locator<SupabaseService>();

  late Dispute dispute;

  List<ChatMessage> chatMessages = [];

  DisputeDetailsViewModel(this.dispute);

  void resolveDispute() async {
    setBusy(true);
    await _supabaseService.changeDisputeStatus(
      disputeId: dispute.disputeId,
      status: DisputeStatus.closed,
      tradeId: dispute.trade!.tradeId,
      tradeStatus: TradeStatus.completed,
    );
    setBusy(false);
  }

  void fetchChatMessages() async {
    setBusy(true);
    chatMessages = await _supabaseService.getTradeChatMessages(dispute.tradeId);
    setBusy(false);
  }

  String getInitiatorRole() {
    if (dispute.openerId == dispute.trade!.traderId &&
        dispute.trade!.offer!.isBuyTrader) {
      return "المشتري";
    } else {
      return "البائع";
    }
  }

  String getOthersideRole() {
    if (dispute.openerId == dispute.trade!.traderId &&
        dispute.trade!.offer!.isBuyTrader) {
      return "البائع";
    } else {
      return "المشتري";
    }
  }

  String getInitiatorName() {
    if (dispute.openerId == dispute.trade!.traderId &&
        dispute.trade!.offer!.isBuyTrader) {
      return dispute.trade!.traderName ?? "";
    } else {
      return dispute.trade!.offer!.ownerName ?? "";
    }
  }

  String getOthersideName() {
    if (dispute.openerId == dispute.trade!.traderId &&
        dispute.trade!.offer!.isBuyTrader) {
      return dispute.trade!.offer!.ownerName ?? "";
    } else {
      return dispute.trade!.traderName ?? "";
    }
  }

  String getInitiatorEmail() {
    if (dispute.openerId == dispute.trade!.traderId &&
        dispute.trade!.offer!.isBuyTrader) {
      return dispute.trade!.traderEmail ?? "";
    } else {
      return dispute.trade!.offer!.ownerEmail ?? "";
    }
  }

  String getOthersideEmail() {
    if (dispute.openerId == dispute.trade!.traderId &&
        dispute.trade!.offer!.isBuyTrader) {
      return dispute.trade!.offer!.ownerEmail ?? "";
    } else {
      return dispute.trade!.traderEmail ?? "";
    }
  }

  @override
  void onData(List<Dispute>? data) {
    super.onData(data);
    _logger.i("onData");
    if (data != null) {
      dispute = data.firstWhere(
        (element) => element.disputeId == dispute.disputeId,
      );
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.i("An error occured with message $error");
  }

  @override
  Stream<List<Dispute>> get stream =>
      _supabaseService.disputesController.stream;
}
