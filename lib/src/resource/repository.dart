import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import 'package:phabis_flutter/src/ui/home_page.dart';
import 'package:phabis_flutter/src/ui/invoice_page.dart';

class Repository {
  final invoiceApiProvider = InvoiceApiProvider();
  List<Invoice> invoices =[];

  Future<List> autocompleteInvoice(String pattern) async {
    if (pattern.length <= 1) {
      return <Invoice>[];
    }
    return invoiceApiProvider.complete(pattern);
  }


}