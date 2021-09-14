import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:phabis_flutter/src/model/InvoiceDto.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import 'package:phabis_flutter/src/resource/repository.dart';
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
int index = 0;
List<Invoice> invoices = [invoice];

Future<void> getInvoicesList() async {
  PageResponse<Invoice> response = await fetchData();
  invoices = response.content;
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
  final _repository = Repository();
  late List<dynamic> _list;
  late bool _isSearching;
  String _searchText = "";
  List searchresult = [];

  _MySearchPageState() {
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
        invoices.getRange(index,index),
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
    final invoice = TypeAheadFormField<dynamic>(
      textFieldConfiguration: TextFieldConfiguration(
          decoration: MyInputDecoration(hintText: 'пациент'),
          controller: _controller),
      suggestionsCallback: (pattern) =>
          _repository.autocompleteInvoice(pattern),
      itemBuilder: (BuildContext context, dynamic invoice) =>
          ListTile(title: Text((invoice as Invoice).toString())),
      transitionBuilder: (context, suggestionsBox, controller) =>
          suggestionsBox,
      noItemsFoundBuilder: (_) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("нема резултати"),
      ),
      onSuggestionSelected: (i) {
        Invoice invoice = i as Invoice;
        _controller.text = invoice.toString();
      },
    );

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
                            String listData = searchresult[index].toString();
                            String listData2 =
                            _list[index].purchaseAmount.toString();
                            return new ListTile(
                              title: new Text(listData.toString()),
                              subtitle: new Text(listData2.toString()),
                            );
                          },
                        )
                      : new ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount:
                              _isLoading ? _list.length + 1 : _list.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (_list.length == index)
                              return Center(child: CircularProgressIndicator());
                            String listData1 =
                                _list[index].counterPartyPartnerName.toString();
                            Invoice listInvoice = _list[index];
                            String listData2 =
                                _list[index].purchaseAmount.toString();
                            return new ListTile(
                                title: new Text(listData1.toString()),
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
                        ))
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
                    hintText: "Search...",
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
        String data = _list[i].counterPartyPartnerName;
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}
