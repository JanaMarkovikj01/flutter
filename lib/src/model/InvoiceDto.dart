
import 'package:json_annotation/json_annotation.dart';

import 'DocumentType.dart';
import 'TurnoverType.dart';
part'InvoiceDto.g.dart';

@JsonSerializable()
class Invoice{

  String? id;
  DocumentType? documentType;
  String? documentNumber;
  String? documentDate;
  double? quantity;
  double? vatRate;
  TurnoverType? turnoverType;
  double? divide;
  bool? confirmed;
  double? groupTotal;
  bool? groupTopRecord;
  String? partnerDocumentNumber;
  String? partnerDocumentDate; //datetime
  String? partnerDocumentDueDatePayment; //datetime
  double? invoicePrice;
  double? discountRate;
  double? discountAmount;
  double? purchasePrice;
  double? purchaseAmount;
  double? vatPurchaseAmount;
  double? partnerDocumentAmount;
  bool? reimbursement;
  double? retailMargin;
  double? retailPrice;
  double? fzoRefPrice;
  String? counterPartyPartnerId;
  String? counterPartyPartnerName;

  DateTime? filterStartPartnerDocumentDate; //datetime
  DateTime? filterEndPartnerDocumentDate; //datetime
  String? filterStartPartnerDocumentDueDatePayment;//datetime
  String? filterEndPartnerDocumentDueDatePayment;//datetime

  Invoice({ this.filterEndPartnerDocumentDueDatePayment,this.filterStartPartnerDocumentDueDatePayment, this.partnerDocumentDate, this.partnerDocumentDueDatePayment,
    this.filterStartPartnerDocumentDate, this.filterEndPartnerDocumentDate,
    this.documentDate, this.counterPartyPartnerId, this.counterPartyPartnerName, this.partnerDocumentNumber, this.invoicePrice,
    this.discountRate, this.discountAmount, this.purchaseAmount, this.purchasePrice, this.vatPurchaseAmount,
    this.partnerDocumentAmount, this.retailMargin, this.reimbursement, this.retailPrice, this.fzoRefPrice,
       this.documentType,
    this.id, this.documentNumber, this.turnoverType,  this.quantity, this.vatRate, this.divide, this.confirmed, this.groupTopRecord, this.groupTotal});


  factory Invoice.fromJson(Map<String,dynamic> data) => _$InvoiceFromJson(data);

  Map<String,dynamic> toJson() => _$InvoiceToJson(this);

}