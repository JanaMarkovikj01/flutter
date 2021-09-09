import 'package:built_value/built_value.dart';

class LazyLoadEvent {

 late int first;
  late int rows;
  late String sortField;
  late int sortOrder;
  late bool globalFilter = true;

  LazyLoadEvent(this.first, this.rows,
   ); //   [this.sortField, sortOrder, this.globalFilter]

  LazyLoadEvent.fromJson(Map<String, dynamic> json)
      : first = json['first'],
        rows = json['rows'],
        sortField = json['sortField'],
        sortOrder = json['sortOrder'],
        globalFilter = json['globalFilters'];

  Map<String, dynamic> toJson() => {
    'first': first,
    'rows': rows,
    'sortField': sortField,
    'sortOrder': sortOrder,
    'filters': null,
    'globalFilter': globalFilter
  };


}

class PageRequestByExample<E> {

  E example;
  LazyLoadEvent lazyLoadEvent;

  PageRequestByExample(this.example, this.lazyLoadEvent);

  Map<String, dynamic> toJson() =>
      {'example': example, 'lazyLoadEvent': lazyLoadEvent};
}


class PageResponse<T> {
  final int totalPages;
  final int totalElements;
  final List<T> content;

  PageResponse(this.totalPages, this.totalElements, this.content);

}
