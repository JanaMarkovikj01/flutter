// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InvoiceDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    partnerDocumentNumber: json['partnerDocumentNumber'] as String?,
    invoicePrice: (json['invoicePrice'] as num?)?.toDouble(),
    discountRate: (json['discountRate'] as num?)?.toDouble(),
    discountAmount: (json['discountAmount'] as num?)?.toDouble(),
    purchaseAmount: (json['purchaseAmount'] as num?)?.toDouble(),
    purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
    vatPurchaseAmount: (json['vatPurchaseAmount'] as num?)?.toDouble(),
    partnerDocumentAmount: (json['partnerDocumentAmount'] as num?)?.toDouble(),
    retailMargin: (json['retailMargin'] as num?)?.toDouble(),
    reimbursement: json['reimbursement'] as bool?,
    retailPrice: (json['retailPrice'] as num?)?.toDouble(),
    fzoRefPrice: (json['fzoRefPrice'] as num?)?.toDouble(),
    documentType:
        _$enumDecodeNullable(_$DocumentTypeEnumMap, json['documentType']),
    id: json['id'] as String?,
    documentNumber: json['documentNumber'] as String?,
    turnoverType:
        _$enumDecodeNullable(_$TurnoverTypeEnumMap, json['turnoverType']),
    quantity: (json['quantity'] as num?)?.toDouble(),
    vatRate: (json['vatRate'] as num?)?.toDouble(),
    divide: (json['divide'] as num?)?.toDouble(),
    confirmed: json['confirmed'] as bool?,
    groupTopRecord: json['groupTopRecord'] as bool?,
    groupTotal: (json['groupTotal'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'documentType': _$DocumentTypeEnumMap[instance.documentType],
      'documentNumber': instance.documentNumber,
      'quantity': instance.quantity,
      'vatRate': instance.vatRate,
      'turnoverType': _$TurnoverTypeEnumMap[instance.turnoverType],
      'divide': instance.divide,
      'confirmed': instance.confirmed,
      'groupTotal': instance.groupTotal,
      'groupTopRecord': instance.groupTopRecord,
      'partnerDocumentNumber': instance.partnerDocumentNumber,
      'invoicePrice': instance.invoicePrice,
      'discountRate': instance.discountRate,
      'discountAmount': instance.discountAmount,
      'purchasePrice': instance.purchasePrice,
      'purchaseAmount': instance.purchaseAmount,
      'vatPurchaseAmount': instance.vatPurchaseAmount,
      'partnerDocumentAmount': instance.partnerDocumentAmount,
      'reimbursement': instance.reimbursement,
      'retailMargin': instance.retailMargin,
      'retailPrice': instance.retailPrice,
      'fzoRefPrice': instance.fzoRefPrice,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$DocumentTypeEnumMap = {
  DocumentType.FISCAL: 'FISCAL',
  DocumentType.FISCALSTOR: 'FISCALSTOR',
  DocumentType.INVOICEIN: 'INVOICEIN',
  DocumentType.INVOICEOUT: 'INVOICEOUT',
  DocumentType.INVOICEOUTSTOR: 'INVOICEOUTSTOR',
  DocumentType.INVOICESTOR: 'INVOICESTOR',
  DocumentType.INVOICEML: 'INVOICEML',
  DocumentType.INVOICEINT: 'INVOICEINT',
  DocumentType.INVOICEEL: 'INVOICEEL',
  DocumentType.INVENTORY: 'INVENTORY',
  DocumentType.TRANSFER: 'TRANSFER',
  DocumentType.PRICECHNG: 'PRICECHNG',
  DocumentType.INTERNALOUT: 'INTERNALOUT',
  DocumentType.INTERNALIN: 'INTERNALIN',
  DocumentType.INTERNALREIMBIN: 'INTERNALREIMBIN',
  DocumentType.INTERNALREIMBOUT: 'INTERNALREIMBOUT',
  DocumentType.DFI: 'DFI',
};

const _$TurnoverTypeEnumMap = {
  TurnoverType.C: 'C',
  TurnoverType.R: 'R',
  TurnoverType.O: 'O',
};
