import 'package:aomlah/core/models/offer.dart';
import 'package:stacked/stacked.dart';

class CreateOfferViewModel extends BaseViewModel {

  Future<bool> submitBuyOffer(String cryptoType,String currencyType,int margin,double cryptoAmount,double minTrade,String terms) async {
    print('Crypro type: '+ cryptoType);
    print('Currency Type: '+ currencyType);
    print('price margin: '+ margin.toString());
    print('Total Crypto: '+ cryptoAmount.toString());
    print('Min Trade: '+ minTrade.toString());
    print('Terms: '+ terms);
    return true;
  }

  submitSellOffer(String cryptoType,String currencyType,int margin,double cryptoAmount,double minTrade,String terms) {
    print('Crypro type: '+ cryptoType);
    print('Currency Type: '+ currencyType);
    print('price margin: '+ margin.toString());
    print('Total Crypto: '+ cryptoAmount.toString());
    print('Min Trade: '+ minTrade.toString());
    print('Terms: '+ terms);
    // Offer m= new Offer(cryptoType: cryptoType, currencyType: currencyType, margin: margin, cryptoAmount: cryptoAmount, minTrade: minTrade, terms: terms, offertype: false);

  }
}