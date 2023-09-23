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
}
