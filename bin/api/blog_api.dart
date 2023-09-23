import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class BlogApi {
  Handler get handler {
    Router router = Router();

    router.get(
      '/blog/noticias',
      (Request req) => Response.ok('Noticias aqui'),
    );

    router.post(
      '/blog/noticias',
      (Request req) => Response.ok('Noticias aqui'),
    );

    router.put(
      '/blog/noticias',
      (Request req) {
        String? id = req.url.queryParameters['id'];
        return Response.ok('Noticias aqui');
      },
    );
    router.delete(
      '/blog/noticias',
      (Request req) {
        String? id = req.url.queryParameters['id'];
        return Response.ok('Noticias aqui');
      },
    );

    return router;
  }
}
