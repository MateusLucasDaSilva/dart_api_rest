import 'dart:convert';

import 'package:shelf/shelf.dart';

extension ParserExtension on String {
  toType(Type type) {
    switch (type) {
      case String:
        return toString();
      case int:
        return int.parse(toString());
      default:
        return toString();
    }
  }
}

extension ConvertRequest on Request {
  Future<Map<String, dynamic>> fromMap() async {
    return json.decode(await readAsString());
  }
}

extension ConvertResponse on Map<String, dynamic> {
  String toJson() => json.encode(this);
}
