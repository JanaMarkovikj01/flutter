import 'dart:convert';

import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import 'package:phabis_flutter/src/ui/search_page.dart';

import 'network_util.dart';
//URLs
final String tokenUrl =
    "https://artemisoft.dyndns-work.com/phabis2-login/oauth/token";
final String hostUrl = 'https://artemisoft.dyndns-work.com:8443';
final String invoiceListUrl =
    hostUrl + "/phabis2-turnover/api/turnoverInvoice/page";
 final String logoutUrl = "";
 final String partnerCompleteUrl=baseUrl + "/phabis2-product/api/partner/complete";
 final String loginUrl="";
 final String baseUrl = 'https://artemisoft.dyndns-work.com:8443';
 final String allInvoicesUrl =
    baseUrl + '/phabis2-turnover/api/turnoverInvoice/page';

//TOKEN RESOURCES
String username = 'phabisjwtclientid';
String password = 'XY7kmzoNzl100';
String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

Map<String, String> headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Accept': 'application/json',
  'Authorization': basicAuth
};

Map<String, String> body = {
  'grant_type': "password",
  'password': "admin1",
  'username': "admin"
};
String mainToken='';

//FOR SEARCH PAGE
Invoice thisInvoice = Invoice();
Future<PageResponse<Invoice>> fetchData() async {
  return apiProvider.fetchInvoices(thisInvoice, 0,20);
}
List<Invoice> invoiceList = [];
Future<void> getInvoicesList() async {
  PageResponse<Invoice> response = await fetchData();
  invoiceList = response.content;
  print("METHOD IN TOKEN.DART RESULTS: " + invoiceList.length.toString());
  invoices = response.content;
}

Future<void> getListOfInvoices(Invoice inv) async{
  PageResponse<Invoice> response = await fetchDataForInvoice(inv);
  invoiceList = response.content;
}
Future<PageResponse<Invoice>> fetchDataForInvoice(Invoice inv) async {
  return apiProvider.fetchInvoices(inv, 0,20);
}