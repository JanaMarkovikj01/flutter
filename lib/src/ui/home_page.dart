import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';
import 'package:phabis_flutter/src/resource/token.dart';
import 'package:phabis_flutter/src/ui/search_page.dart';
import 'package:phabis_flutter/src/ui/search_page2.dart';
import 'package:phabis_flutter/src/ui/widget/my_invoice_widget.dart';

InvoiceApiProvider apiProvider = InvoiceApiProvider();
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
                print(snapshot.data);
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      padding,
                      Text(
                        "WELCOME",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage()));
                          },
                          child: Text('Go to search page',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('${snapshot.error}');
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
