// ignore_for_file: unused_import

import 'dart:convert';

class Doodle {
  final int? id;
  final String title;
  final DateTime createdAt;
  late final String drawingData; // JSON string of drawing paths

  Doodle({
    this.id,
    required this.title,
    required this.createdAt,
    required this.drawingData,
  });

  // Convert a Doodle to a map for storing in the database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'drawingData': drawingData,
    };
  }

  // Convert a map to a Doodle object
  factory Doodle.fromMap(Map<String, dynamic> map) {
    return Doodle(
      id: map['id'],
      title: map['title'],
      createdAt: DateTime.parse(map['createdAt']),
      drawingData: map['drawingData'],
    );
  }
}
