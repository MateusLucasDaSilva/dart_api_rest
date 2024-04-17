import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../data/data_source/data_source.dart';
import '../infra/security/security_service.dart';
import '../models/user_model.dart';
import '../utils/parser_extension.dart';

class UserApi {
  final SecurityService _securityService;

  UserApi(this._securityService);

  Handler get handler {
    Router router = Router();

    router.post('/users/create', (Request req) async {
      final Map<String, dynamic> body = await req.fromMap();
      final UserModel user = UserModel.fromMap(body);
      DataSource.db.collection('users').insert(user.toMap());

      return Response.ok(user.toMap().toJson());
    });

    router.get('/users', (Request req) async {
      final result = await DataSource.db.collection('users').getIndexes();

      final List<String> users = [];

      for (var u in result) {
        users.add(UserModel.fromMap(u).toJson());
      }

      return Response.ok(json.encode(users));
    });

    return router;
  }
}
