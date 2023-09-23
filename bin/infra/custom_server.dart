import 'dart:developer';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  static Future<void> initialize({
    required Handler handler,
    required String address,
    required int port,
  }) async {
    await shelf_io.serve(
      handler,
      address.trim(),
      port,
    );
    log('servidor inicializado');
  }
}
