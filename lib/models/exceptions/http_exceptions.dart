import 'dart:io';

class HttpException implements Exception {
  final int? code;
  final String message;

  HttpException({this.code, required this.message});

  @override
  String toString() {
    return message;
  }
}

class BadRequestException extends HttpException {
  BadRequestException({required String message}) : super(code: HttpStatus.badRequest, message: message);
}

class UnauthorizedException extends HttpException {
  UnauthorizedException({required String message}) : super(code: HttpStatus.unauthorized, message: message);
}

class ForbiddenException extends HttpException {
  ForbiddenException({required String message}) : super(code: HttpStatus.forbidden, message: message);
}

class NotFoundException extends HttpException {
  NotFoundException({required String message}) : super(code: HttpStatus.notFound, message: message);
}

class RequestTimeoutException extends HttpException {
  RequestTimeoutException({required String message}) : super(code: HttpStatus.requestTimeout, message: message);
}

class ImATeapotException extends HttpException {
  ImATeapotException({required String message}) : super(code: 418, message: message);
}

class InternalServerError extends HttpException {
  InternalServerError({required String message}) : super(code: HttpStatus.internalServerError, message: message);
}

class BadGatewayException extends HttpException {
  BadGatewayException({required String message}) : super(code: HttpStatus.badGateway, message: message);
}

class ServiceUnavailableException extends HttpException {
  ServiceUnavailableException({required String message}) : super(code: HttpStatus.serviceUnavailable, message: message);
}

class GatewayTimeoutException extends HttpException {
  GatewayTimeoutException({required String message}) : super(code: HttpStatus.gatewayTimeout, message: message);
}
