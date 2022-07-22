import 'package:flutter/material.dart';

class CryptoItem extends StatelessWidget {
  const CryptoItem({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Spacer(),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyText1,
            ),

          ],
        ),
        const Divider(thickness: 2.0),
      ],
    );
  }
}
