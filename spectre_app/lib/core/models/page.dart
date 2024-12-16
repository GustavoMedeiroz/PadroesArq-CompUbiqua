class Page<T> {
  final List<T> content;
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
  final int numberOfElements;
  final bool first;
  final bool last;
  final bool empty;

  Page(
      {required this.content,
      required this.totalPages,
      required this.totalElements,
      required this.size,
      required this.number,
      required this.numberOfElements,
      required this.first,
      required this.last,
      required this.empty});

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return Page<T>(
        content: (json['content'] as List).map((e) => fromJson(e)).toList(),
        totalPages: json['totalPages'],
        totalElements: json['totalElements'],
        size: json['size'],
        number: json['number'],
        numberOfElements: json['numberOfElements'],
        first: json['first'],
        last: json['last'],
        empty: json['empty']);
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJson) {
    return {
      'content': content.map((e) => toJson(e)).toList(),
      'totalPages': totalPages,
      'totalElements': totalElements,
      'size': size,
      'number': number,
      'numberOfElements': numberOfElements,
      'first': first,
      'last': last,
      'empty': empty
    };
  }
}
