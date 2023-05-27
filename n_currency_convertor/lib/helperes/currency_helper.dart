import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/currency.dart';

class CurrencyAPHelper {
  CurrencyAPHelper._();
  static final CurrencyAPHelper currencyAPHelper = CurrencyAPHelper._();

  final String EUR_BASE_URL =
      "https://api.currencyfreaks.com/latest?apikey=f0d09c50086149a2aa068f74d71e3c05";

  // 'https://api.currencyfreaks.com/latest?apikey=f0d09c50086149a2aa068f74d71e3c05&symbols=PKR,GBP,EUR,INR&base=EUR';
  //f0d09c50086149a2aa068f74d71e3c05
  //o33gcxiaeda30qp1PA3FxohuBC5ulhnU

  Future<Currency?> fetchUSDBaseData() async {
    http.Response res = await http.get(Uri.parse(EUR_BASE_URL));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);
      Currency currency = Currency.fromJson(json: decodedData);
      return currency;
    }

    return null;
  }
}

class USDCurrencyAPHelper {
  USDCurrencyAPHelper._();
  static final USDCurrencyAPHelper USDcurrencyAPHelper =
      USDCurrencyAPHelper._();

  final String USD_Base_Url =
      "https://api.currencyfreaks.com/latest?apikey=f0d09c50086149a2aa068f74d71e3c05";

  Future<Currency?> fetchUSDBaseData() async {
    http.Response usd_res = await http.get(Uri.parse(USD_Base_Url));

    if (usd_res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(usd_res.body);
      Currency currency = Currency.fromJson(json: decodedData);
      return currency;
    }

    return null;
  }
}

/*class AllCurrencyAPHelper {
  AllCurrencyAPHelper._();
  static final AllCurrencyAPHelper AllcurrencyAPHelper =
      AllCurrencyAPHelper._();

  final String all_Base_Url =
      "https://openexchangerates.org/api/currencies.json?app_id=b468b5c301764177baaa2bb72a05f248";

  Future<Currency?> fetchUSDBaseData() async {
    http.Response all_res = await http.get(Uri.parse(all_Base_Url));

    if (usd_res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(usd_res.body);
      Currency currency = Currency.fromJson(json: decodedData);
      return currency;
    }

    return null;
  }
}*/
