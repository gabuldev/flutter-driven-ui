import 'dart:convert';

import 'package:flutter/material.dart';

typedef JSON = Map<String, dynamic>;

class JsonWidget {
  final String name;
  final JSON data;
  final EdgeInsets padding;
  JsonWidget({
    required this.name,
    required this.data,
    required this.padding,
  });

  JsonWidget copyWith({
    String? name,
    JSON? data,
    EdgeInsets? padding,
  }) {
    return JsonWidget(
      name: name ?? this.name,
      data: data ?? this.data,
      padding: padding ?? this.padding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'data': data,
      'padding': padding,
    };
  }

  factory JsonWidget.fromMap(Map<String, dynamic> map) {
    return JsonWidget(
      name: map['name'] ?? '',
      data: map['data'] ?? {},
      padding: EdgeInsets.only(
        top: map['padding']?['top'] ?? 0.0,
        bottom: map['padding']?['bottom'] ?? 0.0,
        left: map['padding']?['left'] ?? 0.0,
        right: map['padding']?['right'] ?? 0.0,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory JsonWidget.fromJson(String source) =>
      JsonWidget.fromMap(json.decode(source));

  @override
  String toString() =>
      'JsonWidget(name: $name, data: $data, padding: $padding)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JsonWidget &&
        other.name == name &&
        other.data == data &&
        other.padding == padding;
  }

  @override
  int get hashCode => name.hashCode ^ data.hashCode ^ padding.hashCode;
}
