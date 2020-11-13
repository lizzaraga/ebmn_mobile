import 'package:dio/dio.dart';
import 'package:ebmn_mobile/data/models/auth/AuthUser.dart';
import 'package:ebmn_mobile/data/models/auth/Credentials.dart';
import 'package:ebmn_mobile/data/models/auth/JobUser.dart';
import 'package:ebmn_mobile/repositories/AuthRepository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider((_) => AuthRepository());
final authUserProvider = FutureProvider.autoDispose.family<AuthUser, Credentials>((ref, credentials) async {
  try {
    final authUser = await AuthRepository().login(credentials);
    return authUser;
  } on DioError catch (e) {
    print('DioError ${e.message}');
    return null;
  }
});

final jobUserProvider = FutureProvider.autoDispose.family<JobUser, String>((ref, token) async{
  try {
    final jobUser = await AuthRepository().getJob(token);
    return jobUser;
  } on DioError catch (e) {
    print('DioError ${e.message}');
    return null;
  }
});