import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '/services/rest_api_service.dart';
import '../models/crypto_currency_model.dart';
import '../models/enums.dart';

// TODO: get CryptoCurrency from server with Rest Api

class CryptoCurrenciesProvider with ChangeNotifier {
  RestApiStatus status = RestApiStatus.idle;

  String? _errMsg;
  String get errMsg => _errMsg!;

  List<CryptoCurrencyModel> _cryptoCurrenciesList = [];
  List<CryptoCurrencyModel> get cryptoCurrenciesList => _cryptoCurrenciesList;


  // TODO: Get All CryptoCurrencies
  Future<void> cryptoCurrencies() async {
    http.Response response = await RestApiService.getAllCryptoCurrencies();
    if(response.statusCode == 200) {
      List<dynamic> jsonList = convert.jsonDecode(response.body);
      _cryptoCurrenciesList = jsonList.map((thisone) => CryptoCurrencyModel.fromJson(thisone)).toList();
    } else if(response.statusCode == 401){
      print('Authentication information is missing or invalid');
    } else {
      print('response status code =====> ${response.statusCode}');
    }
    notifyListeners();
  }

}