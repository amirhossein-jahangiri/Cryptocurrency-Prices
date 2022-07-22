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

  // TODO: for list of crypto currencies
  final StreamController<List<CryptoCurrencyModel>> _streamCryptoList =
      StreamController();

  StreamController<List<CryptoCurrencyModel>> get streamCryptoList =>
      _streamCryptoList;

  // TODO: for single crypto currency
  final StreamController<CryptoCurrencyModel> streamCrypto = StreamController.broadcast();

  String? _errMsg;

  String get errMsg => _errMsg!;

  // TODO: Get All CryptoCurrencies
  Future<void> cryptoCurrencies() async {
    status = LoadingStatus.loading;
    notifyListeners();
    http.Response response = await RestApiService.getAllCryptoCurrencies();
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonList = convert.jsonDecode(response.body);
        List<CryptoCurrencyModel> cryptoCurrenciesList =
            jsonList.map((thisone) {
          return CryptoCurrencyModel.fromJson(thisone);
        }).toList();
        _streamCryptoList.sink.add(cryptoCurrenciesList);
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
    http.Response response =
        await RestApiService.getSingleCryptoCurrency(cryptoId);
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = convert.jsonDecode(response.body).first;
        CryptoCurrencyModel cryptoCurrencyModel =
            CryptoCurrencyModel.fromJson(json);
        if (!streamCrypto.isClosed) {
          streamCrypto.sink.add(cryptoCurrencyModel);
        }
      } else {}
    } catch (e) {
      print('error $e');
    }
    notifyListeners();
  }

  @override
  void dispose() {
    streamCrypto.close();
    super.dispose();
  }
}
