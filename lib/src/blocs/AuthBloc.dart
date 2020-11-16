import 'dart:convert';

import 'package:ebmn_mobile/data/models/auth/AuthUser.dart';
import 'package:ebmn_mobile/data/models/auth/Credentials.dart';
import 'package:ebmn_mobile/data/models/auth/JobUser.dart';
import 'package:ebmn_mobile/src/blocs/ExceptionBloc.dart';
import 'package:ebmn_mobile/src/blocs/IBloc.dart';
import 'package:ebmn_mobile/utils/exceptions.dart';
import 'package:ebmn_mobile/utils/flags.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;

class AuthBloc extends ExceptionBloc{

  BehaviorSubject<TaskLifecycle> _authLifecycleSubject = BehaviorSubject<TaskLifecycle>();
  BehaviorSubject<AuthUser> _authUserSubject = BehaviorSubject<AuthUser>();
  BehaviorSubject<JobUser> _jobUserSubject = BehaviorSubject<JobUser>();


  // STREAMS
  Stream<TaskLifecycle> get authLifecycle => _authLifecycleSubject.stream;
  Stream<AuthUser> get authUser => _authUserSubject.stream;
  Stream<JobUser> get jobUser => _jobUserSubject.stream; 
  
  Future<void> login(Credentials credentials) async{
    try {
        _authLifecycleSubject.add(TaskLifecycle.start);
        _authLifecycleSubject.add(TaskLifecycle.inProgress);
        final response = await http.post("https://ebasemedicalnetwork.herokuapp.com/login/", body: {
          "email": credentials.email,
          "password": credentials.password
        });
        final authUser = AuthUser.fromJson(jsonDecode(response.body));

        final jobResponse = await http.get('https://ebasemedicalnetwork.herokuapp.com/job/${authUser.token}/');
        final jobUser = JobUser.fromJson(jsonDecode(jobResponse.body));
        print("Job: ${jobUser.job}");
        if(jobUser.job.toLowerCase() != "clerk" && jobUser.job.toLowerCase() != "patient"){
          print('NoUserFoundException');
          throw NoUserFoundException();
        }
        _authUserSubject.add(authUser);
        _jobUserSubject.add(jobUser);
        _authLifecycleSubject.add(TaskLifecycle.done);
    } catch (e) {
      print('Exception: ${e.runtimeType.toString()}');
      _authLifecycleSubject.add(TaskLifecycle.error);
      pushException(e as Exception);
    }
    
    
  }

  @override
  dispose() {
    // TODO: implement dispose
    super.dispose();
    _authUserSubject.close();
    _jobUserSubject.close();
    _authLifecycleSubject.close();

  }
  
}