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
}