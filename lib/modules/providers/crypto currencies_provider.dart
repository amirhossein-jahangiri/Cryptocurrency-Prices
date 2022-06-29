import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '/services/rest_api_service.dart';
import '../models/crypto_currency_model.dart';
import '../models/enums.dart';

// TODO: get CryptoCurrency from server with Rest Api

class CryptoCurrenciesProvider with ChangeNotifier {
  LoadingStatus status = LoadingStatus.idle;

  final StreamController<List<CryptoCurrencyModel>> _streamCryptoList =
      StreamController();

  StreamController<List<CryptoCurrencyModel>> get streamCryptoList =>
      _streamCryptoList;

  final StreamController<CryptoCurrencyModel> _streamCrypto = StreamController();
  StreamController<CryptoCurrencyModel> get streamCrypto => _streamCrypto;

  String? _errMsg;

  String get errMsg => _errMsg!;

  List<CryptoCurrencyModel> _cryptoCurrenciesList = [];

  List<CryptoCurrencyModel> get cryptoCurrenciesList => _cryptoCurrenciesList;

  CryptoCurrencyModel? _cryptoCurrencyModel;

  CryptoCurrencyModel? get cryptoCurrency => _cryptoCurrencyModel;

  // TODO: Get All CryptoCurrencies
  Future<void> cryptoCurrencies() async {
    status = LoadingStatus.loading;
    notifyListeners();
    http.Response response = await RestApiService.getAllCryptoCurrencies();
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonList = convert.jsonDecode(response.body);
        _cryptoCurrenciesList = jsonList
            .map((thisone) => CryptoCurrencyModel.fromJson(thisone))
            .toList();
        _streamCryptoList.sink.add(_cryptoCurrenciesList);
        status = LoadingStatus.success;
      } else {
        _errMsg =
            'something went wrong res status code is => ${response.statusCode}.';
        status = LoadingStatus.error;
      }
      notifyListeners();
    } catch (e) {
      _errMsg =
          'something went wrong res status code is => ${response.statusCode} and catch error is $e.';
      status = LoadingStatus.error;
    }
    notifyListeners();
  }

  // TODO: Get Single CryptoCurrency
  Future<void> singleCryptoCurrency(String cryptoId) async {
    http.Response response = await RestApiService.getSingleCryptoCurrency(cryptoId);
    try {
      if(response.statusCode == 200) {
        Map<String, dynamic> json = convert.jsonDecode(response.body).first;
        _cryptoCurrencyModel = CryptoCurrencyModel.fromJson(json);
        _streamCrypto.sink.add(_cryptoCurrencyModel!);
      } else {

      }
    } catch (e) {}
    notifyListeners();
  }
}
