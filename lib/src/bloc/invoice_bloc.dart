import 'package:phabis_flutter/src/model/InvoiceModel.dart';
import 'package:phabis_flutter/src/resource/paging_util.dart';
import '../resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class InvoiceBloc {
  final _repository = Repository();
  final _invoicesFetcher = PublishSubject<List<Invoice>>();
/*
  Observable<List<Invoice>> get allInvoices => _invoicesFetcher.stream;

  fetchInvoices(Invoice invoiceDto, int first, int rows) async {
    PageResponse<Invoice> itemModel = await _repository.fetchInvoices(invoiceDto, first, rows);
    List<Invoice> content = itemModel.content;
    _invoicesFetcher.sink.add(content);
  }

  Future<bool> login(String username, String password) async {
    return await _repository.login(username, password);
  }

  Future<bool> logout() async {
    return await _repository.logout();
  }

  dispose() {
    _invoicesFetcher.close();
  }
  */

}

final bloc = InvoiceBloc();

