import 'package:aomlah/core/models/admin_report.dart';
import 'package:aomlah/core/models/dispute.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/services/supabase_service.dart';

class DisputesViewModel extends StreamViewModel<List<Dispute>> {
  final _logger = getLogger("DisputesViewModel");

  final _navService = locator<NavigationService>();
  final _suabaseService = locator<SupabaseService>();

  bool isBusyReport = false;

  List<Dispute> disputes = [];
  late AdminReport report;

  Future<void> init() async {
    _suabaseService.listenToDisputes();
    setBusyReport(true);
    report = await _suabaseService.getAdminReport();
    setBusyReport(false);
  }

  @override
  void onSubscribed() {
    super.onSubscribed();
    _logger.i("Subscribed to Realtime Disputes");
    setBusy(true);
  }

  @override
  void onData(List<Dispute>? data) {
    super.onData(data);
    setBusy(false);
    _logger.i("onData");

    if (data != null) {
      disputes = data.toList();
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("An Error Occured $error");
    setBusy(false);
  }

  void setBusyReport(bool value) {
    isBusyReport = value;
    notifyListeners();
  }

  @override
  Stream<List<Dispute>> get stream => _suabaseService.disputesController.stream;
}
