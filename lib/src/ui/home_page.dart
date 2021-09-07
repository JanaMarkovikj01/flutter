import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phabis_flutter/src/model/TurnoverInvoiceDto.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';

InvoiceApiProvider apiProvider = InvoiceApiProvider();
Invoice invoice = Invoice();

class HomePage extends StatefulWidget {
  static String tag = "home-page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Future<String> fetchToken() async{
  return apiProvider.fetchToken();
}

Future<PageResponse<Invoice>> fetchData() async {
  return apiProvider.fetchInvoices(invoice, 0, 20);
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FutureBuilder(
            future: fetchData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                String s = snapshot.data.toString();
                return Text(s);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
