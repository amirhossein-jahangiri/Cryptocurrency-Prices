import 'dart:async';

import 'package:cryptocurrency_prices/main.dart';
import 'package:cryptocurrency_prices/modules/models/crypto_currency_model.dart';
import 'package:cryptocurrency_prices/modules/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/constants/app_constants.dart';
import '/modules/providers/crypto currencies_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        context.read<CryptoCurrenciesProvider>().cryptoCurrencies();
      });
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.titleScreenConst)),
      body: Consumer<CryptoCurrenciesProvider>(
        builder: (context, coin, child) {
          switch (coin.status) {
            case LoadingStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case LoadingStatus.empty:
              return Center(
                child: Text(
                  'Empty State',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            case LoadingStatus.error:
              return Center(
                child: Text(
                  'Error ${coin.errMsg}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            case LoadingStatus.success:
              return ListView.builder(
                itemCount: coin.cryptoCurrenciesList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      coin.cryptoCurrenciesList[index].rank!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    title: Text(
                      coin.cryptoCurrenciesList[index].price!,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
