import 'package:json_annotation/json_annotation.dart';

part 'crypto_currency_model.g.dart';

@JsonSerializable()
class CryptoCurrencyModel {
 final String? id;
 final String? currency;
 final String? symbol;
 final String? name;
 @JsonKey(name: 'logo_url')
 final String? logo;
 final String? status;
 final String? price;
 @JsonKey(name: 'price_date')
 final String? priceDate;
 @JsonKey(name: 'price_timestamp')
 final String? priceTimeStamp;
 final String? rank;

 const CryptoCurrencyModel({
   required this.id,
   required this.currency,
   required this.symbol,
   required this.name,
   required this.logo,
   required this.status,
   required this.price,
   required this.priceDate,
   required this.priceTimeStamp,
   required this.rank,
});

  factory CryptoCurrencyModel.fromJson(Map<String, dynamic> json) => _$CryptoCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCurrencyModelToJson(this);

}