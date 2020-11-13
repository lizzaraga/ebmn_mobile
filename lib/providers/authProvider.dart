import 'package:dio/dio.dart';
import 'package:ebmn_mobile/data/models/auth/AuthUser.dart';
import 'package:ebmn_mobile/data/models/auth/Credentials.dart';
import 'package:ebmn_mobile/data/models/auth/JobUser.dart';
import 'package:ebmn_mobile/repositories/AuthRepository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authUserProvider = StateProvider<AuthUser>((_) => null);
final jobUserProvider = StateProvider<JobUser>((_) => null);

final _authProvider = Provider((_) => AuthRepository());

final authUserFutureProvider = FutureProvider.autoDispose.family<AuthUser, Credentials>((ref, credentials) async {
  try {
    final authUser = await ref.read(_authProvider).login(credentials);
    return authUser;
  } on DioError catch (e) {
    print('DioError ${e.message}');
    return null;
  }
});

final jobUserFutureProvider = FutureProvider.autoDispose.family<JobUser, String>((ref, token) async{
  try {
    final jobUser = await ref.read(_authProvider).getJob(token);
    return jobUser;
  } on DioError catch (e) {
    print('DioError ${e.message}');
    return null;
  }
});