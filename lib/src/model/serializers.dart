import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';

import 'InvoiceModel.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Invoice,
])
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())..add(Iso8601DateTimeSerializer())).build();