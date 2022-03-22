import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/models/chat_message.dart';

class ChatViewModel extends StreamViewModel<List<ChatMessage>> {
  final String tradeId;
  ChatViewModel(this.tradeId);

  final _logger = getLogger("ChatViewModel");

  final _navService = locator<NavigationService>();
  final _suabaseService = locator<SupabaseService>();

  List<ChatMessage> offers = [];

  @override
  void onSubscribed() {
    super.onSubscribed();
    _logger.i("Subscribed to Realtime Chat");
    setBusy(true);
  }

  @override
  void onData(List<ChatMessage>? data) {
    super.onData(data);
    setBusy(false);
    _logger.i("onData");

    if (data != null) {
      offers = data.toList();
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("An Error Occured $error");
    setBusy(false);
  }

  @override
  Stream<List<ChatMessage>> get stream => _suabaseService.getTradeChatStream(
        tradeId,
      );
}
