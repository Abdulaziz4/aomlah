import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';

class OffersService {
  final _supabaseService = locator<SupabaseService>();
  final _userService = locator<UserService>();

  Future<void> closeOffer(Offer offer) async {
    int numOfDisputedTrades = await _supabaseService.getNumOfDisputedTrades(
      offer.offerID,
    );

    if (numOfDisputedTrades != 0) {
      throw Exception("لاتستطلع إغلاق عرض ولازال هناك نزاع على تداول");
    }

    int numOfOpenTrades = await _supabaseService.getNumOfOpenrades(
      offer.offerID,
    );

    if (numOfOpenTrades != 0) {
      throw Exception("لاتستطلع إغلاق عرض ولازال هناك تداولات غير مكتملة");
    }

    //1. change offer status to closed
    await _supabaseService.closeOffer(offerId: offer.offerID);
    //2. deduct the remaining offer from debt
    await _supabaseService.updateUserDebt(
      _userService.user.profileId,
      -1 * offer.remainingQuantity,
    );
  }
}
