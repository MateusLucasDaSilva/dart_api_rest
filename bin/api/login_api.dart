import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/security/security_service.dart';
import '../utils/parser_extension.dart';

class LoginApi {
  final SecurityService _securityService;

  LoginApi(this._securityService);

  Handler get handler {
    Router router = Router();

    router.post(
      '/login',
      (Request req) async {
        Map<String, dynamic> bodyResponse = {};
        final Map<String, dynamic> body = await req.fromMap();

        String email = body['email'] ?? '';
        String password = body['password'] ?? '';

        log(email);
        log(password);

        final token = await _securityService.generateJWT('1');
        final JWT? valid = await _securityService.validateJWT(token);

        if (valid != null) {
          bodyResponse['token'] = token;
        }

        return Response.ok(bodyResponse.toJson());
      },
    );

    return router;
  }
}
