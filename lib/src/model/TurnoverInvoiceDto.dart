import 'dart:core';

import 'package:built_value/serializer.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:phabis_flutter/src/model/TurnoverDto.dart';
import 'package:time_machine/time_machine.dart';

@getter
@setter
@data
@toString
@JsonSerializable()
class Invoice extends TurnoverDto{

  Invoice(){
//this.documentNumber = 'PRI18000340';
//this.partnerDocumentNumber = '18461/18';
  }

  String? partnerDocumentNumber;
  late LocalDate partnerDocumentDate;
  late LocalDate partnerDocumentDueDatePayment;
  late double invoicePrice;
  late double discountRate;
  late double discountAmount;
  late double purchasePrice;
  late double purchaseAmount;
  late double vatPurchaseAmount;
  late double partnerDocumentAmount;
  late bool reimbursement;
  late double retailMargin;
  late double retailPrice;
  late double fzoRefPrice;

  // PartnerDto counterParty;
  late String counterPartyPartnerId;
  late String counterPartyPartnerName;

   LocalDate? filterStartPartnerDocumentDate;
  late LocalDate filterEndPartnerDocumentDate;
  late LocalDate filterStartPartnerDocumentDueDatePayment;
  late LocalDate filterEndPartnerDocumentDueDatePayment;

  //  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);
  //Map<String, dynamic> toJson() => _$InvoiceToJson(this);

  //factory Invoice([updates(InvoiceBuilder b)]) = _$Invoice;
  static Serializer<Invoice> get serializer => _$invoiceSerializer;

  static get _$invoiceSerializer => null;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        //partnerDocumentNumber: json["partnerDocumentNumber"],
      //invoicePrice: json["invoicePrice"],
      );

  Map<String, dynamic> toJson() => {
       // "partnerDocumentNumber": partnerDocumentNumber,
      };
}
