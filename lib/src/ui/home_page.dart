import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';

InvoiceApiProvider apiProvider = InvoiceApiProvider();

class HomePage extends StatefulWidget {
  static String tag ="home-page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Future<String> getToken () async {
  Future<String> token = (await apiProvider.fetchToken()) as Future<String>;
  return token;
}
class _HomePageState extends State<HomePage>{
String token = getToken().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Column(
      children: [
        FutureBuilder(future: getToken(),
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
           return Text(snapshot.data.toString());
          }else if(snapshot.hasError){
          return Text('${snapshot.error}');
          }else{
           return  CircularProgressIndicator();
          }
        },
        )
      ],
    ),
    );
  }
}

