class Page<T> {
  final List<T> content;
  final int totalPages;
  final int totalElements;
  final int number;
  final int size;

  Page({
    required this.content,
    required this.totalPages,
    required this.totalElements,
    required this.number,
    required this.size,
  });

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return Page(
      content: (json['content'] as List)
          .map((item) => fromJsonT(item))
          .toList(),
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      number: json['number'],
      size: json['size'],
    );
  }
}