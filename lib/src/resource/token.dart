import 'dart:convert';

//URLs
final String tokenUrl =
    "https://artemisoft.dyndns-work.com/phabis2-login/oauth/token";
 final String hostUrl = 'https://artemisoft.dyndns-work.com:8443';
 final String invoiceListUrl =
    hostUrl + "/phabis2-turnover/api/turnoverInvoice/page";

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