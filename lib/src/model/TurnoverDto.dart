
import 'package:json_annotation/json_annotation.dart';
part'TurnoverDto.g.dart';

@JsonSerializable()
class TurnoverDto{
    String? id;
  //DocumentType documentType;
    String? documentNumber;
    DateTime? documentDate;
    double? quantity;
    double? vatRate;
   // TurnoverType? turnoverType;
    double? divide;
    bool? confirmed;
    double? groupTotal;
    bool? groupTopRecord;
  TurnoverDto({ this.id, this.documentNumber, this.documentDate, this.quantity, this.vatRate, this.divide, this.confirmed, this.groupTopRecord, this.groupTotal});

  factory TurnoverDto.fromJson(Map<String,dynamic> data) => _$TurnoverDtoFromJson(data);

  Map<String,dynamic> toJson() => _$TurnoverDtoToJson(this);

}