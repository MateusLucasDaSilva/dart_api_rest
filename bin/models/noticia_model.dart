import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoticiaModel {
  final int? id;
  final String title;
  final String description;
  final String image;
  final DateTime dtPublication;
  final DateTime? dtUpdated;
  NoticiaModel({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.dtPublication,
    this.dtUpdated,
  });

  @override
  String toString() {
    return 'NoticiaModel(id: $id, title: $title, description: $description, image: $image, dtPublication: $dtPublication, dtUpdated: $dtUpdated)';
  }

  @override
  bool operator ==(covariant NoticiaModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.dtPublication == dtPublication &&
        other.dtUpdated == dtUpdated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        dtPublication.hashCode ^
        dtUpdated.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'dtPublication': dtPublication.millisecondsSinceEpoch,
      'dtUpdated': dtUpdated?.millisecondsSinceEpoch,
    };
  }

  factory NoticiaModel.fromMap(Map<String, dynamic> map) {
    return NoticiaModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      dtPublication:
          DateTime.fromMillisecondsSinceEpoch(map['dtPublication'] as int),
      dtUpdated: map['dtUpdated'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dtUpdated'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticiaModel.fromJson(String source) =>
      NoticiaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
