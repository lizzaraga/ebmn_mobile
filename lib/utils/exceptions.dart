class AuthException implements Exception{
  final String message;

  const AuthException([this.message = "AuthException error"]);

  @override
  String toString() {
    // TODO: implement toString
    return "AuthException: $message";
  }
}

class NoUserFoundException extends AuthException{}