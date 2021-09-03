import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Invoice page'),
        ),
        body: InvoiceCard());
  }
}

void navigate() { print("Pressed");}
var padding = Padding(padding: EdgeInsets.all(12));

Widget InvoiceCard() {
  return Center(
    //heightFactor: 3.3,
    child: Column(children: [
      padding,
      Container(
          height: 250,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            //borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 3.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Фактура сериски број',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 3.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Количина:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        'Количина',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )),
              padding,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 3.0),
                      ),
                    ),
                    child: Text(
                      'Износ без ДДВ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  padding,
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 3.0),
                      ),
                    ),
                    child: Text(
                      'Даночна стапка',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 3.0),
                      ),
                    ),
                    child: Text(
                      'ДДВ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  padding,
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 3.0),
                      ),
                    ),
                    child: Text(
                      'Единечна цена',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Вупно:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        'Вкупен износ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )),
            ],
          )),
      padding,
      TextButton(
          onPressed: () => navigate(),
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.blue),
          child: Text('Go back',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
    ]),
  );
}
