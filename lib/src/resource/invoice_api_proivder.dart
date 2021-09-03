import 'dart:io';
import 'package:dio/dio.dart';
import 'package:phabis_flutter/src/model/InvoiceModel.dart';
import 'package:phabis_flutter/src/model/serializers.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';

import 'network_util.dart';

class InvoiceApiProvider{
/*
  static final String invoiceUrl = '/api/dentists/page';
  static final String invoiceComplete = '/api/dentists/complete';
  static final String loginUrl = '/api/login';
  static final String logoutUrl = '/api/logout';
  static final Options options =
  Options(contentType: ContentType.parse("application/json"));

  Future<List> complete(String pattern) async {
    var autocompleteQuery = {"query": pattern, "maxResults": 10};
    return await NetworkUtil.internal()
        .post(invoiceComplete, data: autocompleteQuery, options: options)
        .then((Response response) {
      return response.data.map((json) => serializers.deserializeWith(Invoice.serializer, json)).toList();
    });
  }

  Future<PageResponse<Invoice>> fetchInvoices(
      Invoice invoice, int first, int rows) async {
    LazyLoadEvent lazyLoadEvent = LazyLoadEvent(first, rows);
    var te = invoice;
    bool sameDay = false;
    if (invoice.partnerDocumentDate != null) {
      if (invoice.partnerDocumentDate ==
          invoice.partnerDocumentDueDatePayment) {
        sameDay = true;
      }
    }
    var example = serialize(te);
    PageRequestByExample req = PageRequestByExample(example, lazyLoadEvent);
    return await NetworkUtil.internal()
        .post(invoiceUrl, data: req, options: options)
        .then((Response response) {
      var statusCode = response.statusCode;
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception("Не може да се добијат податоци од серверот");
      }
      var data = response.data;
      List content = data["content"];
      List<Invoice> invoices = content
          .map((t) => serializers.deserializeWith(Invoice.serializer, t))
          .map((t) => t..partnerDocumentDate = t.partnerDocumentDueDatePayment)
          .toList();
      return PageResponse<Invoice>(
          data["totalPages"], data["totalElements"], invoices);
    });
  }

  Future<Invoice> saveInvoice(Invoice tr) async {
    return await NetworkUtil.internal()
        .put(invoiceUrl, data: serialize(tr), options: options)
        .then((Response response) {
      if (response.statusCode < 201 && response.statusCode > 201) {
        throw new Exception("Не може да се испратат податоци на серверот");
      }
      return serializers.deserializeWith(Invoice.serializer, response.data);
    });
  }

  Future<String> deleteInvoice(String id) async {
    if (id != null) {
      return await NetworkUtil.internal()
          .delete(invoiceUrl, data: id)
          .then((Response response) {
        if (response.statusCode != 200) {
          throw new Exception("Не може да се испратат податоци на серверот");
        }
        return id;
      });
    } else {
      return id;
    }
  }

  Object serialize(Invoice t) =>
      serializers.serializeWith(Invoice.serializer, t);

  Future<bool> login(String username, String password) async {
    var data = {
      "j_username": username,
      "j_password": password,
      "submit": "Login"
    };
    Options options = Options(
        contentType: ContentType.parse("application/x-www-form-urlencoded"));
    return await NetworkUtil.internal()
        .post(loginUrl, data: data, options: options)
        .then((Response response) {
      int statusCode = response.statusCode;
      var headers = response.headers;
      NetworkUtil.cookie = headers.value('set-cookie'); // session cookie
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception(
            "${headers.value("error")}: ${headers.value("message")}. "
                "Погрешно корисничко име или шифра.");
      }
      return true;
    });
  }

  Future<bool> logout() async {
    return await NetworkUtil.internal()
        .get(logoutUrl)
        .then((Response response) {
      print("response: $response");
      return true; // response.statusCode == 200;
    });
  }

*/
}

