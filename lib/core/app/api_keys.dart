import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIKeys {
  static late String covalenthqKey = dotenv.env['COVALENT_HQ_KEY'] ?? "";
  static late String blockcypherKey = dotenv.env['BLOCKCYPHER_KEY'] ?? "";
  static late String blockcypherKeyEth =
      dotenv.env['BLOCKCYPHER_ETH_KEY'] ?? "";
  static late String cryptoCompKey = dotenv.env['CRYPTOCOMP_KEY'] ?? "";
  static late String cryptoCompKeyEth = dotenv.env['CRYPTOCOMP_ETH_KEY'] ?? "";
}
