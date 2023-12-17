import 'package:flutter/material.dart';
import 'dart:convert';

final iconToMap = ((IconData icon) => {
      'codePoint': icon.codePoint,
      'fontFamily': icon.fontFamily,
      'fontPackage': icon.fontPackage,
    });

final mapToIcon = ((Map<String, dynamic> map) => IconData(
      map['codePoint'],
      fontFamily: map['fontFamily'],
      fontPackage: map['fontPackage'],
    ));

final jsonToIcon = ((String encodedJson) {
  final Map<String, dynamic> map = jsonDecode(encodedJson);
  return mapToIcon(map);
});
