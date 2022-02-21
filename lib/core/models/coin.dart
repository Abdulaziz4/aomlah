class Coin {
  final String id;
  final String name;
  final String fullName;
  final String imageUrl;
  final String price;
  final String volume24hr;
  final String volume24hrBtc;
  final String change24hr;
  final String mktCap;
  final String fullyDilutedMKCap;
  final String maxSupply;
  final String circulationSupplay;
  final String circulationSupplayUsd;

  Coin({
    required this.id,
    required this.name,
    required this.fullName,
    required this.imageUrl,
    required this.price,
    required this.volume24hr,
    required this.volume24hrBtc,
    required this.change24hr,
    required this.mktCap,
    required this.maxSupply,
    required this.circulationSupplay,
    required this.circulationSupplayUsd,
    required this.fullyDilutedMKCap,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    final nested = json["DISPLAY"]["USD"];
    final info = json["CoinInfo"];
    return Coin(
      id: info["Id"],
      name: info["Name"],
      fullName: info["FullName"],
      price: nested["PRICE"],
      volume24hr: nested["VOLUME24HOURTO"],
      volume24hrBtc: nested["VOLUME24HOUR"],
      change24hr: nested["CHANGEPCT24HOUR"],
      mktCap: nested["MKTCAP"],
      circulationSupplay: nested["CIRCULATINGSUPPLY"],
      circulationSupplayUsd: nested["CIRCULATINGSUPPLYMKTCAP"],
      imageUrl: info["ImageUrl"],
      maxSupply: nested["SUPPLY"],
      fullyDilutedMKCap: nested["CIRCULATINGSUPPLYMKTCAP"],
    );
  }

  String getFullLogoUrl() {
    return "https://www.cryptocompare.com" + imageUrl;
  }

  String getPreviewChart() {
    return "https://images.cryptocompare.com/sparkchart/$name/USD/latest.png?ts=1645135200";
  }
}
