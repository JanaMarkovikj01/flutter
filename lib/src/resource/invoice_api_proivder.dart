import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:phabis_flutter/src/model/TurnoverInvoiceDto.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import 'package:phabis_flutter/src/resource/token.dart';

import 'network_util.dart';

class InvoiceApiProvider {
  static final Options options =
      Options(contentType: ContentType.parse("application/json").toString());

  Future<String> fetchToken() async {
    var response = await http.post(
      tokenUrl,
      headers: headers,
      body: body,
    );
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");

    Map<String, dynamic> jsonData =
        jsonDecode(response.body) as Map<String, dynamic>;

    String tokenString = jsonData['access_token'];

    Future<String> token = new Future<String>.value(tokenString);

    return token;
  }

  Future<PageResponse<Invoice>> fetchInvoices(
      Invoice invoice, int first, int rows) async {

    LazyLoadEvent lazyLoadEvent = LazyLoadEvent(first, rows);
   /* bool sameDay = false;
    if (invoice.filterStartPartnerDocumentDate != null) {
      if (invoice.filterStartPartnerDocumentDate ==
          invoice.filterEndPartnerDocumentDate) {
        sameDay = true;
      }
    }*/
    var example = invoice.toJson();
    print(example);
    PageRequestByExample req = PageRequestByExample(example, lazyLoadEvent);

    return await NetworkUtil.internal()
        .post(invoiceListUrl, data: req, options: options)
        .then((Response response) {
      var statusCode = response.statusCode;
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception("Не може да се добијат податоци од серверот");
      }
      var data = response.data;
      print(data);

      List<Invoice> dataSerialize= jsonDecode(data['content']);
      List<Invoice> invoices = dataSerialize.map((dataSerialize) => Invoice.fromJson(data)).toList();
      return PageResponse<Invoice>(
          data["totalPages"], data["totalElements"], invoices!);
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

  Future<List> complete(String pattern) async {
    var autocompleteQuery = {"query": pattern, "maxResults": 10};
    return await NetworkUtil.internal()
        .post(invoiceCompleteUrl, data: autocompleteQuery, options: options)
        .then((Response response) {
      List<dynamic> data = jsonDecode(response.data);
      List<Invoice> invoices = data.map((data) => Invoice.fromJson(data)).toList();
      return invoices;
    });
  }

  Future<bool> login(String username, String password) async {
    var data = {
      "j_username": username,
      "j_password": password,
      "submit": "Login"
    };
    Options options = Options(
        contentType: "application/x-www-form-urlencoded");
    return await NetworkUtil.internal()
        .post(loginUrl, data: data, options: options)
        .then((Response response) {
      int? statusCode = response.statusCode;
      var headers = response.headers;
      NetworkUtil.newToken = headers.value('access_token')!; // session token
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception(
            "${headers.value("error")}: ${headers.value("message")}. "
                "Погрешно корисничко име или шифра.");
      }
      return true;
    });
  }

}
