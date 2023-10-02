import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/security/security_service.dart';

class LoginApi {
  final SecurityService _securityService;

  LoginApi(this._securityService);

  Handler get handler {
    Router router = Router();

    router.post(
      '/login',
      (Request req) async {
        final token = await _securityService.generateJWT('1');
        final JWT? valid = await _securityService.validateJWT(token);

        return Response.ok((valid != null).toString());
      },
    );

    return router;
  }
}
