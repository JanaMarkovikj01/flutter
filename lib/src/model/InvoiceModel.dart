
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lombok/lombok.dart';
import 'package:time_machine/time_machine.dart';

@getter
@setter
@data
@toString
class Invoice {
   Invoice({
      required this.partnerDocumentNumber,
      required this.partnerDocumentDate,
      required this.partnerDocumentDueDatePayment,
   });

   late String partnerDocumentNumber;
   late DateTime partnerDocumentDate;
    late DateTime partnerDocumentDueDatePayment;
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
//  @nullable PartnerDto counterParty;

  //factory TurnoverInvoiceDto([updates(DentistBuilder b)]) = _$Dentist;
 static Serializer<Invoice> get serializer => _$invoiceSerializer;

  static get _$invoiceSerializer => null;
   factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
      partnerDocumentNumber: json["id"],
      partnerDocumentDate: json["targetStart"],
      partnerDocumentDueDatePayment: json["targetEnd"],

   );

   Map<String, dynamic> toJson() => {
      "id": partnerDocumentNumber,
      "targetStart": partnerDocumentDate,
      "targetEnd": partnerDocumentDueDatePayment,

   };

}
