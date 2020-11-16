import 'dart:convert';

import 'package:ebmn_mobile/data/models/EmergencyModel.dart';
import 'package:ebmn_mobile/src/blocs/ExceptionBloc.dart';
import 'package:ebmn_mobile/utils/flags.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;


class EmergencyBloc extends ExceptionBloc{

  BehaviorSubject<TaskLifecycle> _createEmergencyStateSubject = BehaviorSubject<TaskLifecycle>();
  ValueStream<TaskLifecycle> get createLifecycle  => _createEmergencyStateSubject.stream;

  BehaviorSubject<TaskLifecycle> _updateEmergencyStateSubject = BehaviorSubject<TaskLifecycle>();
  ValueStream<TaskLifecycle> get updateLifecycle  => _updateEmergencyStateSubject.stream;

  BehaviorSubject<List<EmergencyModel>> _emergenciesSubject = BehaviorSubject<List<EmergencyModel>>();
  ValueStream<List<EmergencyModel>> get emergencies => _emergenciesSubject.stream;

   Future<void> createEmergency(String token, String problem) async{
    try {
      _createEmergencyStateSubject.add(TaskLifecycle.inProgress);
      await http.post("https://ebasemedicalnetwork.herokuapp.com/emergency/create/$token/", body: {
        "specific_problem": problem
      });
      _createEmergencyStateSubject.add(TaskLifecycle.done);
      _createEmergencyStateSubject.add(TaskLifecycle.start);
    } catch (e) {
      pushException(e as Exception);
    }
  }

  Future<void> getEmergencies(String token) async{
    try {
      final response = await http.get("https://ebasemedicalnetwork.herokuapp.com/emergency/patient/get/$token/");
      final list =  List<Map<String, dynamic>>.from(jsonDecode(response.body)["emergencies"])
      .map((e) => EmergencyModel.fromJson(e)).toList(growable: false);
      _emergenciesSubject.add(list);
    } catch (e) {
      _emergenciesSubject.addError(e);
      pushException(e as Exception);
    }
  }
  Future<void> getClerkEmergencies(String token) async{
    try {
      final response = await http.get("https://ebasemedicalnetwork.herokuapp.com/emergency/get/$token/");
      final list =  List<Map<String, dynamic>>.from(jsonDecode(response.body)["emergencies"])
      .map((e) => EmergencyModel.fromJson(e)).toList(growable: false);
      _emergenciesSubject.add(list);
    } catch (e) {
      
      pushException(e as Exception);
    }
  }
  Future<void> updateEmergency(EmergencyModel model, String token) async{
    try {
      model.emergencyStatus = "Treated";
      _updateEmergencyStateSubject.add(TaskLifecycle.start);
      _updateEmergencyStateSubject.add(TaskLifecycle.inProgress);
      await http.put("https://ebasemedicalnetwork.herokuapp.com/emergency/update/$token/${model.emergencyId}/", body: {
        "name": "Treated"
      });
      _updateEmergencyStateSubject.add(TaskLifecycle.done);
      _emergenciesSubject.add(emergencies.value);
    } catch (e) {
      _updateEmergencyStateSubject.add(TaskLifecycle.error);
      pushException(e as Exception);
    }
  }
  @override
  dispose() {
    // TODO: implement dispose
    super.dispose();
    _createEmergencyStateSubject.close();
    _emergenciesSubject.close();
    _updateEmergencyStateSubject.close();
  }

}