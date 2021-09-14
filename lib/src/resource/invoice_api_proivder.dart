import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:phabis_flutter/src/model/InvoiceDto.dart';
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
    Map<String, dynamic> jsonData =
        jsonDecode(response.body) as Map<String, dynamic>;
    Future<String> token = new Future<String>.value(jsonData['access_token']);

    return token;
  }

  Future<PageResponse<Invoice>> fetchInvoices(
      Invoice invoice, int first, int rows) async {
    LazyLoadEvent lazyLoadEvent = LazyLoadEvent(first, rows);
    //empty invoice
    var example = Invoice();
    PageRequestByExample req = PageRequestByExample(example, lazyLoadEvent);
    return await NetworkUtil.internal()
        .post(invoiceListUrl, data: req, options: options)
        .then((Response response) {
      var statusCode = response.statusCode;
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception("Не може да се добијат податоци од серверот");
      }
      var data = response.data;
      print("FETCH INVOICES DATA: " + data.toString().substring(0, 205));

      List content = data["content"];
      List<Invoice> invoices = [];
      for (int i = 0; i < content.length; i++) {
        Invoice invoice = Invoice.fromJson(content[i]);
        invoices.add(invoice);
      }

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

  Future<bool> login(String username, String password) async {
    var data = {
      "j_username": username,
      "j_password": password,
      "submit": "Login"
    };
    Options options = Options(contentType: "application/x-www-form-urlencoded");
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
