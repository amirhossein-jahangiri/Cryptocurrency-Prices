import 'dart:async';

import 'package:cryptocurrency_prices/modules/models/crypto_currency_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modules/providers/crypto currencies_provider.dart';

class CryptoCurrencyDetailsScreen extends StatefulWidget {
  const CryptoCurrencyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CryptoCurrencyDetailsScreen> createState() =>
      _CryptoCurrencyDetailsScreenState();
}

class _CryptoCurrencyDetailsScreenState extends State<CryptoCurrencyDetailsScreen> {
  Timer? timer;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final String cryptoId = ModalRoute.of(context)!.settings.arguments as String;
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        context.read<CryptoCurrenciesProvider>().singleCryptoCurrency(cryptoId);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<CryptoCurrenciesProvider>().streamCrypto.close();
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<CryptoCurrencyModel>(
        stream: context.read<CryptoCurrenciesProvider>().streamCrypto.stream,
        builder: (context, AsyncSnapshot snapshot) {
          CryptoCurrencyModel? cryptoData = snapshot.data;
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData == true) {
            return ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  cryptoData!.name!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  cryptoData.symbol!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  cryptoData.price.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            );
          } else {
            return const Center(child: Text('not data'));
          }
        }
      ),
    );
  }
}
