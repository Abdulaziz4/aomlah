import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIKeys {
  // static const blockcypherKey = "14409c2675354b03924f8889e6bcd60c";
  // static const blockcypherKeyEth = "1100993db54a4fa6a80d03e70cec7ca8";
  // static const cryptoCompKey =
  //     "af86a1499b576f1fec8c58df5cfc702ca2cc714557bebd0f52a8b38752ea6335";
  // static const cryptoCompKeyEth =
  //     "6dac7d551badb052ee4e75a160a8490332152641a48430d874ce368b55bb846d";
  static const covalenthqKey = "ckey_d0ad1937aee3421eade828aa4bc";
  static late String blockcypherKey = dotenv.env['BLOCKCYPHER_KEY'] ?? "";
  static late String blockcypherKeyEth =
      dotenv.env['BLOCKCYPHER_ETH_KEY'] ?? "";
  static late String cryptoCompKey = dotenv.env['CRYPTOCOMP_KEY'] ?? "";
  static late String cryptoCompKeyEth = dotenv.env['CRYPTOCOMP_ETH_KEY'] ?? "";
}
