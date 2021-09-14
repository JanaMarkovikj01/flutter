import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import 'package:phabis_flutter/src/ui/selected_invoice.dart';
import 'package:phabis_flutter/src/ui/widget/my_text_form_field.dart';

import 'home_page.dart';

class MySearchPage extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return new Size.fromHeight(20.0);
  }

  @override
  _MySearchPageState createState() => new _MySearchPageState();
}

Invoice invoice = Invoice();
Invoice probenInvoice = Invoice();
int index = 0;
List<Invoice> invoices = [invoice];

Future<PageResponse<Invoice>> fetchData() async {
  return apiProvider.fetchInvoices(invoice, 0, 20);
}

Future<void> getInvoicesList() async {
  PageResponse<Invoice> response = await fetchData();
  invoices = response.content;
  probenInvoice = invoices[2];
}

class _MySearchPageState extends State<MySearchPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  Widget appBarTitle = new Text(
    "Search Page",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  late List<dynamic> _list;
  late bool _isSearching;
  String _searchText = "";
  List searchresult = [];

  _MySearchPageState() {
    getInvoicesList();
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    _scrollController.addListener(_onScroll);
    index = 0;
    values();
  }

  _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      _fetchData();
    }
  }

  Future _fetchData() async {
    await new Future.delayed(new Duration(seconds: 2));
    int lastIndex = _list.length;
    // print(_list.length);

    setState(() {
      _list.addAll(
        invoices.getRange(index, index),
      );
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void values() {
    getInvoicesList();
    _list = invoices;
    print(_list.length);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        key: globalKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: buildAppBar(context),
        ),
        body: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Flexible(
                child: searchresult.length != 0 || _controller.text.isNotEmpty
                    ? new ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchresult.length,
                        itemBuilder: (BuildContext context, int index) {
                          String listData = searchresult[index]
                              .counterPartyPartnerName
                              .toString();
                          String listData2 =
                              _list[index].documentNumber.toString();
                          Invoice listInvoice = searchresult[index];
                          return new ListTile(
                              title: new Text(listData.toString()),
                              subtitle: new Text(listData2.toString()),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyInvoicePage(
                                            invoice: listInvoice,
                                          )),
                                );
                              });
                        },
                      )
                    : new Column(children: [
                        Text('Elements in invoice list: ' +
                            _list.length.toString()),
                        Text(probenInvoice.documentDate.toString()),
                        //Text("PARSED DATETIME STRING: " + parsing(probenInvoice.documentDate).toString())
                      ]),
              )
            ],
          ),
        ));
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            if (this.icon.icon == Icons.search) {
              this.icon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _controller,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search name...",
                    hintStyle: new TextStyle(color: Colors.white)),
                onChanged: searchOperation,
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String partnerName =
            _list[i].counterPartyPartnerName; //ФЕНИКС/нелт example
        String documentNumber = _list[i].documentNumber; // PRI18002535 example
        if (partnerName.toLowerCase().contains(searchText.toLowerCase())) {
          Invoice searchedInvoice = _list[i];
          searchresult.add(searchedInvoice);
        }
      }
    }
  }
}
