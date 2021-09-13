import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';

class Repository {
  final invoiceApiProvider = InvoiceApiProvider();

  Future<List> autocompleteInvoice(String pattern) async {
    if (pattern.length <= 1) {
      return <Invoice>[];
    }
    return invoiceApiProvider.complete(pattern);
  }
}