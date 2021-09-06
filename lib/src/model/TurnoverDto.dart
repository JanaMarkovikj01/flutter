import 'package:time_machine/time_machine.dart';

import 'TurnoverType.dart';

class TurnoverDto{
  TurnoverDto({documentNumber, quantity}){
  }

   late String id;
  // DocumentType documentType;
   late String documentNumber;
   late LocalDateTime documentDate;
   late double quantity;
   late double vatRate;
  late  TurnoverType turnoverType;
   late double divide;
   late bool confirmed;
   late double groupTotal;
   late bool groupTopRecord;
   late Instant createDate;
   //ProductDto product;
   //AccountDto account;
  // PharmacyDto pharmacy;

   factory TurnoverDto.fromJson(Map<String, dynamic> json) => TurnoverDto(
     documentNumber: json["documentNumber"],
     quantity: json["quantity"],
   );

   Map<String, dynamic> toJson() => {
     "documentNumber": documentNumber,
     "quantity": quantity,
   };

}