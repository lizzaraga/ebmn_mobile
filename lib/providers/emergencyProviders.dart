import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ebmn_mobile/data/models/EmergencyModel.dart';
//import 'package:ebmn_mobile/providers/authProvider.dart';
import 'package:ebmn_mobile/providers/tokenProvider.dart';
import 'package:ebmn_mobile/src/providers/EmergencyStateNotifier.dart';
import 'package:ebmn_mobile/utils/flags.dart';
import 'package:hooks_riverpod/all.dart';

import 'package:http/http.dart' as http;

final createEmergencyLifecycleProvider = StateProvider<TaskLifecycle>((_) => TaskLifecycle.start);





///

final emergencyStateProvider = StateNotifierProvider<EmergencyStateNotifier>((ref) => EmergencyStateNotifier(EmergencyState(
  lifecycle: TaskLifecycle.start,
  model: []
)));

final createEmergencyProvider = FutureProvider.family<void, String>((ref, problem) async {
  final token = ref.read(tokenProvider);
  try {
    await ref.read(emergencyStateProvider).createEmergency(token, problem);
    print("Emmergency Was created");
    return;
  }  catch (e) {
    print('createEmergencyProvider: \n ${e.message}');
  }
});

final emergenciesProvider = FutureProvider.autoDispose<List<EmergencyModel>>((ref) async {
  //final dio = Dio(BaseOptions(baseUrl: "https://ebasemedicalnetwork.herokuapp.com"));
  final token = ref.read(tokenProvider);
  try {
     final response = await ref.read(emergencyStateProvider).getEmergencies(token);
     return response;
  } on DioError catch (e) {
    print('createEmergencyProvider: \n ${e.message}');
    return null;
  }
});


