import 'package:shelf/shelf.dart';

import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
import 'services/noticia_service.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');

  final Handler cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(BlogApi(NoticiaService()).handler)
      .handler;

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception.middleware)
      .addHandler(cascadeHandler);

  final String address = await CustomEnv.get<String>(key: 'server_address');
  final int port = await CustomEnv.get<int>(key: 'server_port');

  CustomServer.initialize(
    handler: handler,
    address: address,
    port: port,
  );
}
