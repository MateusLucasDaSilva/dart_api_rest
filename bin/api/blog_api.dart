import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';

class BlogApi {
  final GenericService _service;

  BlogApi(this._service);

  Handler get handler {
    Router router = Router();

    router.get(
      '/blog/noticias',
      (Request req) {
        _service.findAll();
        return Response.ok('Noticias aqui');
      },
    );

    router.post(
      '/blog/noticias',
      (Request req) {
        // _service.save('');

        return Response.ok('Noticias aqui');
      },
    );

    router.put(
      '/blog/noticias',
      (Request req) {
        String? id = req.url.queryParameters['id'];
        // _service.save();
        return Response.ok('Noticias aqui');
      },
    );
    router.delete(
      '/blog/noticias',
      (Request req) {
        String? id = req.url.queryParameters['id'];
        // _service.delete(int.parse(id!));
        return Response.ok('Noticias aqui');
      },
    );

    return router;
  }
}
