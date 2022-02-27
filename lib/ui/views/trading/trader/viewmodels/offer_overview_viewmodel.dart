import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OfferPurchaseOverviewViewmodel extends StreamViewModel<List<Offer>> {
  final _supabaseService = locator<SupabaseService>();
  final formKey = GlobalKey<FormState>();

  double amount = 0;

  late Offer offer;

  void listentoOffers(Offer offer) {
    this.offer = offer;
  }

  @override
  void onData(List<Offer>? data) {
    super.onData(data);
    if (data != null) {
      offer = data.firstWhere((off) => off.offerID == offer.offerID);
    }
  }

  @override
  Stream<List<Offer>> get stream => _supabaseService.offersController.stream;
}
