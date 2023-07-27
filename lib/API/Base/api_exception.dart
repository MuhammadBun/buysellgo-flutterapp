class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}

class NotFoundException extends AppException {
  NotFoundException([message]) : super(message, "Not Found: ");
}

class InternalServerException extends AppException {
  InternalServerException([message])
      : super(message, "Internal Server Error: ");
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([message])
      : super(message, "Service Unavailable: ");
}

class ConflictException extends AppException {
  ConflictException([message]) : super(message, "Conflict: ");
}

class ForbiddenException extends AppException {
  ForbiddenException([message]) : super(message, "Forbidden: ");
}

class GatewayTimeoutException extends AppException {
  GatewayTimeoutException([message]) : super(message, "Gateway Timeout: ");
}
