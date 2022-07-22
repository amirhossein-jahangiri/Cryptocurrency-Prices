import 'package:cryptocurrency_prices/modules/models/crypto_currency_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:developer';

import '/constants/app_constants.dart';
import '/modules/providers/crypto currencies_provider.dart';
import '/constants/route_name_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<CryptoCurrenciesProvider>().cryptoCurrencies();
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        context.read<CryptoCurrenciesProvider>().cryptoCurrencies();
        log('Update Data=====================');
      });
    });
    super.initState();
  }



  @override
  void dispose() {
    timer!.cancel();
    context.watch<CryptoCurrenciesProvider>().streamCryptoList.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.titleScreenConst)),
      body: StreamBuilder<List<CryptoCurrencyModel>>(
          stream:
              context.read<CryptoCurrenciesProvider>().streamCryptoList.stream,
          builder:
              (context, AsyncSnapshot<List<CryptoCurrencyModel>> snapshot) {
            List<CryptoCurrencyModel>? cryptoData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData == true) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: cryptoData!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RouteNameCons.cryptoCurrencyDetailsScreenRouteName,
                        arguments: cryptoData[index].id!,
                      );
                    },
                    title: Text(
                      cryptoData[index].symbol!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      cryptoData[index].priceDate!,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: Text(
                      cryptoData[index].price.toString(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                },
              );
            } else {
              return Text(
                'not data',
                style: Theme.of(context).textTheme.headline4,
              );
            }
          }),
    );
  }
}
