import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import 'package:phabis_flutter/src/resource/token.dart';
import 'package:phabis_flutter/src/ui/search2.dart';
import 'package:phabis_flutter/src/ui/search_page.dart';
import 'package:phabis_flutter/src/ui/selected_invoice.dart';

import 'invoice_page.dart';

InvoiceApiProvider apiProvider = InvoiceApiProvider();
Invoice invoice = Invoice();

class HomePage extends StatefulWidget {
  static String tag = "home-page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Future<String> fetchToken() async {
  mainToken = await apiProvider.fetchToken();
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
            future: fetchToken(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                String tokenString = snapshot.data.toString();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TOKEN:", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(tokenString),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MySearchPage()));
                        },
                        child: Text('Go to search page',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))),
                  ],
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('${snapshot.error}');
              } else {
                return Container(
                  alignment: Alignment.center,
                  child:
                    CircularProgressIndicator(),

              );
              }
            },
          )
        ],
      ),
    );
  }
}
