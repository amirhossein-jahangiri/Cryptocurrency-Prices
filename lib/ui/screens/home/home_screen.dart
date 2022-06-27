import 'package:cryptocurrency_prices/main.dart';
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
    context.read<CryptoCurrenciesProvider>().cryptoCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.titleScreenConst)),
      body: Consumer<CryptoCurrenciesProvider>(
        builder: (context, coin, child) {
          return coin.cryptoCurrenciesList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: coin.cryptoCurrenciesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        coin.cryptoCurrenciesList[index].name!,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      trailing: Text(
                        coin.cryptoCurrenciesList[index].rank!,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
