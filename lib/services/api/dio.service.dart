import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/models/auth/session_token.model.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';
import 'package:trip_n_joy_front/models/exceptions/http_exceptions.dart';
import 'package:trip_n_joy_front/models/user/user.model.dart';

import '../log/logger.service.dart';
import 'http.service.dart';

const BASE_URL = String.fromEnvironment("BASE_URL");

class DioService extends HttpService {
  Dio? _dio;

  static header() => {"Content-Type": "application/json"};

  Future<HttpService> init() async {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: header()));
    initInterceptors();

    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          logger.i(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger
              .i("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.i("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio!.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == HttpStatus.ok) {
        return response;
      } else if (response.statusCode == HttpStatus.unauthorized) {
        throw UnauthorizedException(
            message: AppLocalizations.instance
                .translate("errors.exceptions.unauthorized"));
      } else if (response.statusCode == HttpStatus.internalServerError) {
        throw InternalServerError(
            message: AppLocalizations.instance
                .translate("errors.exceptions.serverError"));
      } else {
        throw HttpException(
            message: AppLocalizations.instance
                .translate("errors.exceptions.unexpected"));
      }
    } on SocketException catch (e) {
      logger.e(e);
      throw Exception(AppLocalizations.instance.translate("errors.internet"));
    } on FormatException catch (e) {
      logger.e(e);
      throw Exception(AppLocalizations.instance
          .translate("errors.exceptions.responseFormat"));
    } on DioError catch (e) {
      logger.e(e);
      throw Exception(e);
    } catch (e) {
      logger.e(e);
      throw Exception(
          AppLocalizations.instance.translate("errors.exceptions.unexpected"));
    }
  }

  @override
  Future<User> loadUser(String token) async {
    final response = await request(
      url: "/user/" + token,
      method: Method.GET,
    );
    return User.fromJson(response.data);
  }

  @override
  Future<SessionToken> login(String email, String password) async {
    final response = await request(
      url: "/login",
      method: Method.POST,
      params: {
        "email": email,
        "password": password,
      },
    );
    return SessionToken.fromJson(response.data);
  }

  @override
  Future<SessionToken> signup(SignupCredentials data) async {
    final response = await request(
      url: "/signup",
      method: Method.POST,
      params: data.toJson(),
    );
    return SessionToken.fromJson(response.data);
  }

  @override
  Future<void> deleteUser(String token) async {
    await request(
      url: '/user' + token,
      method: Method.DELETE,
    );
  }

  @override
  Future<SessionToken> verifyAccount(String code) async {
    final response = await request(
      url: "/confirm",
      method: Method.POST,
      params: {
        "code": code,
      },
    );
    return SessionToken.fromJson(response.data);
  }
}
