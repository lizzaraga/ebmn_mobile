import 'dart:convert';

import 'package:ebmn_mobile/data/models/EmergencyModel.dart';
import 'package:ebmn_mobile/utils/flags.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:http/http.dart' as http;

class EmergencyState{
  TaskLifecycle lifecycle = TaskLifecycle.start;
  List<EmergencyModel> model = [];

  EmergencyState({this.lifecycle, this.model});

}

class EmergencyStateNotifier extends StateNotifier<EmergencyState>{
  EmergencyStateNotifier (EmergencyState state) : super(state);
  
  Future<void> createEmergency(String token, String problem) async{
    state = EmergencyState(lifecycle: TaskLifecycle.start, model: state.model);
    state = EmergencyState(lifecycle: TaskLifecycle.inProgress, model: state.model);
    await http.post("https://ebasemedicalnetwork.herokuapp.com/emergency/create/$token/", body: {
      "specific_problem": problem
    });
    state = EmergencyState(lifecycle: TaskLifecycle.done, model: state.model);
  }

  Future<List<EmergencyModel>> getEmergencies(String token) async{
    final response = await http.get("https://ebasemedicalnetwork.herokuapp.com/emergency/patient/get/$token/");
    final list =  List<Map<String, dynamic>>.from(jsonDecode(response.body)["emergencies"])
    .map((e) => EmergencyModel.fromJson(e)).toList(growable: false);
    return list;
  }
}