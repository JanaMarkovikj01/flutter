import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phabis_flutter/src/model/TurnoverDto.dart';
import 'package:phabis_flutter/src/model/TurnoverInvoiceDto.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';

Invoice invoice = Invoice();
var apiProvider = InvoiceApiProvider();
class SearchingPage extends StatefulWidget {
  const SearchingPage({Key? key}) : super(key: key);

  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  final ScrollController _controller = ScrollController();
  List<String> _dummy = List.generate(20, (index) => 'Item $index');
  bool _isLoading = false;

  /*Future<PageResponse<Invoice>> inovoices =
      apiProvider.fetchInvoices(invoice, 0, 20);*/

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onScroll() {
    if (_controller.offset >=
        _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      _fetchData();
    }
  }

  Future _fetchData() async {
    await new Future.delayed(new Duration(seconds: 2));
    int lastIndex = _dummy.length;

    setState(() {
      _dummy.addAll(
          List.generate(15, (index) => "New Item ${lastIndex+index}")
      );
      _isLoading = false;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('lazy list'),
    ),
    body: ListView.builder(
      controller: _controller,
      itemCount: _isLoading ? _dummy.length + 1 : _dummy.length,
      itemBuilder: (context, index) {
        if (_dummy.length == index)
          return Center(
              child: CircularProgressIndicator()
          );
        return ListTile(
            title: Text(
                _dummy[index]
            )
        );
      },
    ),
  );
}

}

/*
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        FutureBuilder<PageResponse<Invoice>>(
            future: inovoices,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return Text('ok');
              } else if (snapshot.hasError) {
                return Text('error');
              } else {
                return Text('xd');
              }
            }),
      ],
    ));
  }


 */

