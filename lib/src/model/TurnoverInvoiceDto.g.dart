// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TurnoverInvoiceDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    partnerDocumentNumber: json['partnerDocumentNumber'] as String?,
    partnerDocumentDate: json['partnerDocumentDate'] == null
        ? null
        : DateTime.parse(json['partnerDocumentDate'] as String),
    partnerDocumentDueDatePayment: json['partnerDocumentDueDatePayment'] == null
        ? null
        : DateTime.parse(json['partnerDocumentDueDatePayment'] as String),
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
    filterEndPartnerDocumentDate: json['filterEndPartnerDocumentDate'] == null
        ? null
        : DateTime.parse(json['filterEndPartnerDocumentDate'] as String),
    filterEndPartnerDocumentDueDatePayment:
        json['filterEndPartnerDocumentDueDatePayment'] == null
            ? null
            : DateTime.parse(
                json['filterEndPartnerDocumentDueDatePayment'] as String),
    filterStartPartnerDocumentDate:
        json['filterStartPartnerDocumentDate'] == null
            ? null
            : DateTime.parse(json['filterStartPartnerDocumentDate'] as String),
    filterStartPartnerDocumentDueDatePayment:
        json['filterStartPartnerDocumentDueDatePayment'] == null
            ? null
            : DateTime.parse(
                json['filterStartPartnerDocumentDueDatePayment'] as String),
  )
    ..id = json['id'] as String?
    ..documentNumber = json['documentNumber'] as String?
    ..documentDate = json['documentDate'] == null
        ? null
        : DateTime.parse(json['documentDate'] as String)
    ..quantity = (json['quantity'] as num?)?.toDouble()
    ..vatRate = (json['vatRate'] as num?)?.toDouble()
    ..divide = (json['divide'] as num?)?.toDouble()
    ..confirmed = json['confirmed'] as bool?
    ..groupTotal = (json['groupTotal'] as num?)?.toDouble()
    ..groupTopRecord = json['groupTopRecord'] as bool?;
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'documentNumber': instance.documentNumber,
      'documentDate': instance.documentDate?.toIso8601String(),
      'quantity': instance.quantity,
      'vatRate': instance.vatRate,
      'divide': instance.divide,
      'confirmed': instance.confirmed,
      'groupTotal': instance.groupTotal,
      'groupTopRecord': instance.groupTopRecord,
      'partnerDocumentNumber': instance.partnerDocumentNumber,
      'partnerDocumentDate': instance.partnerDocumentDate?.toIso8601String(),
      'partnerDocumentDueDatePayment':
          instance.partnerDocumentDueDatePayment?.toIso8601String(),
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
      'filterStartPartnerDocumentDate':
          instance.filterStartPartnerDocumentDate?.toIso8601String(),
      'filterEndPartnerDocumentDate':
          instance.filterEndPartnerDocumentDate?.toIso8601String(),
      'filterStartPartnerDocumentDueDatePayment':
          instance.filterStartPartnerDocumentDueDatePayment?.toIso8601String(),
      'filterEndPartnerDocumentDueDatePayment':
          instance.filterEndPartnerDocumentDueDatePayment?.toIso8601String(),
    };
