abstract class SecurityService<T> {
  Future<String> generateJWT(String userId);
  Future<T?> validateJWT(String token);
}
