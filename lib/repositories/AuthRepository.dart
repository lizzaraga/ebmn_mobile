import 'package:dio/dio.dart';
import 'package:ebmn_mobile/data/models/auth/AuthUser.dart';
import 'package:ebmn_mobile/data/models/auth/Credentials.dart';
import 'package:ebmn_mobile/data/models/auth/JobUser.dart';

BaseOptions _options = BaseOptions(baseUrl: "https://ebasemedicalnetwork.herokuapp.com");

class AuthRepository{
  Dio _dio = Dio(_options);
  Future<AuthUser> login(Credentials credentials) async {
    final response = await _dio.post("/login/", data: {
      "email": credentials.email,
      "password": credentials.password
    });

    return AuthUser.fromJson(response.data);
  }

  Future<JobUser> getJob(String token) async {
    final response = await _dio.get('/job/$token/');
    return JobUser.fromJson(response.data);
  }
}