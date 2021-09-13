import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import 'package:phabis_flutter/src/ui/home_page.dart';
import 'package:phabis_flutter/src/ui/search_page.dart';

int index = 0;
class InvoicePage extends StatefulWidget {
  static String tag = 'invoice-page';

  const InvoicePage({Key? key}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

Invoice invoice = Invoice();

Future<void> getInvoiceData(int i) async {
  PageResponse<Invoice> response = await fetchData();
  invoice = response.content[i];
}

class _InvoicePageState extends State<InvoicePage> {
  void ButtonClick() {
    setState(() {
      index++;
      getInvoiceData(index);
    });
  }

  @override
  void initState() {
    super.initState();
    index = 0;
    getInvoiceData(index);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              title: Text('Invoice Page'),
            ),
            InvoiceCard(invoice),
            TextButton(
                onPressed: () {
                  ButtonClick();
                },
                child: Text('Next invoice',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            TextButton(
                onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => MySearchPage()),);},
                child: Text('Go to search page',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),

          ],
        ),
      ),
    );
  }
}

void navigate() {
  print("Pressed");
}

var padding = Padding(padding: EdgeInsets.all(12));

Widget InvoiceCard(Invoice invoice) {
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
                        'Број на фактура: ',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        invoice.documentNumber.toString(),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
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
                        invoice.purchaseAmount.toString(),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
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
                      style: TextStyle(fontSize: 13),
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
                      invoice.retailPrice.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                      'ДДВ %',
                      style: TextStyle(fontSize: 13),
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
                      invoice.retailMargin.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                        invoice.invoicePrice.toString(),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )),
            ],
          )),
      padding
    ]),
  );
}
