import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/model/formatter.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import 'package:phabis_flutter/src/resource/token.dart';
import 'package:phabis_flutter/src/ui/selected_invoice.dart';
import 'package:phabis_flutter/src/ui/widget/appbar_title.dart';
import 'package:phabis_flutter/src/ui/widget/my_invoice_widget.dart';
import 'package:phabis_flutter/src/ui/widget/my_text_form_field.dart';

import 'invoice_list.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

Invoice invoiceToSend = Invoice();
List<Invoice> invoices = [];

class _SearchPageState extends State<SearchPage> {

  final _formKey = GlobalKey<FormState>();
  InvoiceApiProvider apiProvider = InvoiceApiProvider();

  TextEditingController _invoiceDocumentNumberController = TextEditingController();
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  TextEditingController _workDayController = TextEditingController();

  @override
  void initState() {
    super.initState();
   // getInvoicesList();
   // invoiceToSend.counterPartyPartnerName = "ФЕНИКС ФАРМА - СКОПЈЕ";
    invoiceToSend.documentNumber = 'PRI18000340';
    _invoiceDocumentNumberController.text = invoiceToSend.documentNumber!;
    if (invoiceToSend.filterStartPartnerDocumentDueDatePayment != null) {
      _fromController.text = formatter.format(
          invoiceToSend.filterStartPartnerDocumentDate!.toLocal());
    }
    if (invoiceToSend.filterEndPartnerDocumentDate != null) {
      _toController.text = formatter.format(
          invoiceToSend.filterEndPartnerDocumentDate!.toLocal());
    }
    if (_fromController.text == _toController.text) {
      _workDayController.value = _fromController.value;
    }
  }

  @override
  void dispose() {
    _invoiceDocumentNumberController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _workDayController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final searchInvoice = TypeAheadFormField<dynamic>(
      textFieldConfiguration: TextFieldConfiguration(
          decoration: MyInputDecoration(hintText: 'број на документ'),
          controller: _invoiceDocumentNumberController),
      suggestionsCallback: (pattern) =>
          apiProvider.autocompleteInvoice(pattern),
      itemBuilder: (BuildContext context, dynamic invoice) =>
          ListTile(title: Text(
              (invoice as Invoice).counterPartyPartnerName.toString()),
            subtitle: Text((invoice as Invoice).documentNumber.toString()),),
      transitionBuilder: (context, suggestionsBox, controller) =>
      suggestionsBox,
      noItemsFoundBuilder: (_) =>
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("нема резултати"),
          ),
      onSuggestionSelected: (p) {
        Invoice newInvoice = p as Invoice;
        invoiceToSend.documentNumber = newInvoice.documentNumber;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MyInvoicePage(
                    invoice: newInvoice,
                  )),
        );
        _invoiceDocumentNumberController.text = newInvoice.toString();
      },
    );
    final from = DateTimePickerFormField(
        controller: _fromController,
        initialValue: invoiceToSend.filterStartPartnerDocumentDate,
        format: formatter,
        dateOnly: true,
        decoration: InputDecoration(labelText: 'од'),
        onChanged: (dt) =>
            setState(() =>
            invoiceToSend.filterStartPartnerDocumentDate = dt.toUtc())
      // example = example.rebuild((t) => t..filterTreatmentDateFrom = dt?.toUtc())),
    );
    final to = DateTimePickerFormField(
        controller: _toController,
        initialValue: invoiceToSend.filterEndPartnerDocumentDate,
        format: formatter,
        dateOnly: true,
        decoration: InputDecoration(labelText: 'до'),
        onChanged: (dt) =>
            setState(() =>
            invoiceToSend.filterEndPartnerDocumentDate = dt.toUtc())
      // example = example.rebuild((t) => t..filterTreatmentDateTo = dt?.toUtc())),
    );


    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Пребарување", style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() => _resetFields());
                }),
            new IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  if (_invoiceDocumentNumberController.text.isEmpty) {

                  }
                  _formKey.currentState!.save();
                  // Navigator.of(context).popAndPushNamed(HomePage.tag);
                })
          ],
        ),
        body:
        Column(
          children: [
            padding,
        Form(
            key: _formKey,
            child: ListView(
              itemExtent: 80,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                new ListTile(leading: const Icon(Icons.text_fields, size: 40,),
                    title: searchInvoice),
                //Text(invoice.counterPartyPartnerName.toString())
                //new ListTile(leading: const Icon(Icons.today), title: workDay),
                new ListTile(leading: const Icon(Icons.today, size: 40,), title: from),
                new ListTile(leading: const Icon(Icons.today, size: 40,), title: to),
                //new ListTile(leading: const Icon(Icons.person_outline), title: dentist)
              ],
            )),
            padding,
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListPage(
                      invoice: invoiceToSend,
                    )),
              );
            }, child: Text('Search invoices', style: TextStyle(fontSize: 23),)
            )
       ], ),
    );
  }

  void _resetFields() {
    _formKey.currentState!.reset();
    _invoiceDocumentNumberController.clear();
    _workDayController.clear();
    _fromController.clear();
    _toController.clear();
  }
}
