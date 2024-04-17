// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String cpf;
  UserModel({
    required this.name,
    required this.email,
    required this.cpf,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? cpf,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'cpf': cpf,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      cpf: map['cpf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, email: $email, cpf: $cpf)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.cpf == cpf;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ cpf.hashCode;
}
