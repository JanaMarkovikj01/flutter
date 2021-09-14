import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/ui/widget/my_invoice_widget.dart';

import 'search_page.dart';

class MyInvoicePage extends StatelessWidget {
  const MyInvoicePage({Key? key, required this.invoice}) : super(key: key);

  final Invoice invoice;

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySearchPage()),
                  );
                },
                child: Text('Go to search page',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
