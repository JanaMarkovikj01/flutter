import 'dart:async';

import 'package:phabis_flutter/src/model/InvoiceModel.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';

import 'invoice_api_proivder.dart';

class Repository {

  final invoiceApiProvider = InvoiceApiProvider();
/*
  Future<PageResponse<Invoice>> fetchInvoices(Invoice invoiceDto, int first, int rows) =>
      invoiceApiProvider.fetchInvoices(invoiceDto, first, rows);


  Future<Invoice> saveInvoice(Invoice t) => invoiceApiProvider.saveInvoice(t);

  Future<String> deleteInvoice(String id) => invoiceApiProvider.deleteInvoice(id);


  Future<List> autocompleteInvoice(String pattern) async {
    if (pattern.length <= 1) {
      return <Invoice>[];
    }
    return invoiceApiProvider.complete(pattern);
  }

  Future<bool> login(String username, String password) async =>
    invoiceApiProvider.login(username, password);

  Future<bool> logout() async =>
    invoiceApiProvider.logout();
*/

}

