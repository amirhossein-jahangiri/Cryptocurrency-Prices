// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCurrencyModel _$CryptoCurrencyModelFromJson(Map<String, dynamic> json) =>
    CryptoCurrencyModel(
      id: json['id'] as String?,
      currency: json['currency'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      logo: json['logo_url'] as String?,
      status: json['status'] as String?,
      price: json['price'] as String?,
      priceDate: json['price_date'] as String?,
      priceTimeStamp: json['price_timestamp'] as String?,
      rank: json['rank'] as String?,
    );

Map<String, dynamic> _$CryptoCurrencyModelToJson(
        CryptoCurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'symbol': instance.symbol,
      'name': instance.name,
      'logo_url': instance.logo,
      'status': instance.status,
      'price': instance.price,
      'price_date': instance.priceDate,
      'price_timestamp': instance.priceTimeStamp,
      'rank': instance.rank,
    };
