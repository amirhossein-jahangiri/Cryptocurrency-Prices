import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../modules/providers/crypto currencies_provider.dart';
import 'crypto_currency_details_widgets/crypto_item_widget.dart';
import '/modules/models/crypto_currency_model.dart';
import '../../../constants/app_constants.dart';

class CryptoCurrencyDetailsScreen extends StatefulWidget {
  const CryptoCurrencyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CryptoCurrencyDetailsScreen> createState() =>
      _CryptoCurrencyDetailsScreenState();
}

class _CryptoCurrencyDetailsScreenState extends State<CryptoCurrencyDetailsScreen> {
  Timer? timer;

  CryptoCurrenciesProvider cryptoProvider = CryptoCurrenciesProvider();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final String cryptoId = ModalRoute.of(context)!.settings.arguments as String;
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        if(mounted) {}
        cryptoProvider.singleCryptoCurrency(cryptoId);
      });
    });
    super.initState();
  }


  @override
  void dispose() {
    cryptoProvider.streamCrypto.close();
    timer!.cancel();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(),
      body: StreamBuilder<CryptoCurrencyModel>(
          stream: cryptoProvider.streamCrypto.stream,
          builder: (context, AsyncSnapshot snapshot) {
            CryptoCurrencyModel? cryptoData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData == true) {
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 15.h,
                ),
                children: [
                  CryptoItem(
                    title: AppConstants.currencyItem,
                    value: cryptoData!.currency!,
                  ),
                ],
              );
            } else {
              return const Center(child: Text('not data'));
            }
          }),
    );
  }
}
