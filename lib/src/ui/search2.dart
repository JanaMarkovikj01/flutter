import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _controller = ScrollController();
  bool _isLoading = false;
  List<String> _dummy = List.generate(20, (index) => 'Item $index');
  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  _onScroll(){
    if (_controller.offset >=
        _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      _fetchData();
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
