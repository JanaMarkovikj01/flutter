// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TurnoverDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurnoverDto _$TurnoverDtoFromJson(Map<String, dynamic> json) {
  return TurnoverDto(
    id: json['id'] as String?,
    documentNumber: json['documentNumber'] as String?,
    documentDate: json['documentDate'] == null
        ? null
        : DateTime.parse(json['documentDate'] as String),
    quantity: (json['quantity'] as num?)?.toDouble(),
    vatRate: (json['vatRate'] as num?)?.toDouble(),
    divide: (json['divide'] as num?)?.toDouble(),
    confirmed: json['confirmed'] as bool?,
    groupTopRecord: json['groupTopRecord'] as bool?,
    groupTotal: (json['groupTotal'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$TurnoverDtoToJson(TurnoverDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentNumber': instance.documentNumber,
      'documentDate': instance.documentDate?.toIso8601String(),
      'quantity': instance.quantity,
      'vatRate': instance.vatRate,
      'divide': instance.divide,
      'confirmed': instance.confirmed,
      'groupTotal': instance.groupTotal,
      'groupTopRecord': instance.groupTopRecord,
    };
