import 'dart:ui';

class Doodle {
  String name;
  List<List<Offset>>
      drawing; // List of strokes, where each stroke is a list of points

  Doodle({required this.name, required this.drawing});

  Map<String, dynamic> toJson() => {
        'name': name,
        'drawing': drawing
            .map((stroke) =>
                stroke.map((point) => [point.dx, point.dy]).toList())
            .toList(),
      };

  static Doodle fromJson(Map<String, dynamic> json) => Doodle(
        name: json['name'],
        drawing: (json['drawing'] as List).map((stroke) {
          return (stroke as List)
              .map((point) => Offset(point[0], point[1]))
              .toList();
        }).toList(),
      );
}
