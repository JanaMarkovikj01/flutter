import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:phabis_flutter/src/model/TurnoverInvoiceDto.dart';

import '../model/formatter.dart';

import '../resource/repository.dart';

import './widget/my_text_form_field.dart';
import './home_page.dart';

@immutable
class SearchPage extends StatefulWidget {
  static String tag = 'search-page';
  @override
  State createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  /*
  final _formKey = GlobalKey<FormState>();
  final _repository = Repository();
 static Invoice example = Invoice();


  TextEditingController _invoiceController = TextEditingController();
  TextEditingController _workDayController = TextEditingController();
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _invoiceController.text = example.toString();
  }

  @override
  void dispose() {
    _invoiceController.dispose();
    _workDayController.dispose();
    _fromController.dispose();
    _toController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final invoice = TypeAheadFormField<dynamic>(
      textFieldConfiguration: TextFieldConfiguration(
          decoration: MyInputDecoration(hintText: 'фактура'),
          controller: _invoiceController),
      suggestionsCallback: (pattern) => _repository.autocompleteInvoice(pattern),
      itemBuilder: (BuildContext context, dynamic invoice) => ListTile(title: Text((invoice as Invoice).toString())),
      transitionBuilder: (context, suggestionsBox, controller) =>
      suggestionsBox,
      noItemsFoundBuilder: (_) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("нема резултати"),
      ),
      onSuggestionSelected: (p) {
        Invoice invoice = p as Invoice;
        _invoiceController.text = invoice.toString();
      },
    );
    final workDay = DateTimePickerFormField(
      controller: _workDayController,
      format: formatter,
      dateOnly: true,
      decoration: InputDecoration(labelText: 'ден'),
      onChanged: (dt) => setState(() =>
          selectWorkDay(dt)),
    );
    final from = DateTimePickerFormField(
      controller: _fromController,
      initialValue: example.partnerDocumentDate,
      format: formatter,
      dateOnly: true,
      decoration: InputDecoration(labelText: 'од'),
      onChanged: (dt) => setState(() =>
          example = example.rebuild((t) => t..filterTreatmentDateFrom = dt?.toUtc())),
    );
    final to = DateTimePickerFormField(
      controller: _toController,
      initialValue: example.partnerDocumentDueDatePayment,
      format: formatter,
      dateOnly: true,
      decoration: InputDecoration(labelText: 'до'),
        onChanged: (dt) => setState(() =>
          example = example.rebuild((t) => t..filterTreatmentDateTo = dt?.toUtc())),
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Пребарување"),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() => _resetFields());
                }),
            new IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  if (_invoiceController.text.isEmpty) {
                    var builder = example.toBuilder();
                    builder.patient = null;
                    example = builder.build();
                  }
                  _formKey.currentState!.save();
                  Navigator.of(context).popAndPushNamed(HomePage.tag);
                })
          ],
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                new ListTile(leading: const Icon(Icons.photo_album), title: invoice),
                new ListTile(leading: const Icon(Icons.today), title: workDay),
                new ListTile(leading: const Icon(Icons.today), title: from),
                new ListTile(leading: const Icon(Icons.today), title: to),
              ],
            ))
    );
  }


  void _resetFields() {
    example = Invoice();
    _formKey.currentState!.reset();
    _invoiceController.clear();
    _workDayController.clear();
    _fromController.clear();
    _toController.clear();
  }
  
  
  */
}
