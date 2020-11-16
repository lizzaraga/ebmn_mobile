import 'package:ebmn_mobile/src/blocs/IBloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class ExceptionBloc implements IBloc{
  BehaviorSubject<Exception> _exceptionSubject = BehaviorSubject<Exception>();
  ValueStream<Exception> get exception => _exceptionSubject.stream;
  @override
  dispose() {
    // TODO: implement dispose
    _exceptionSubject.close();
  }
  
  pushException<T extends Exception>(T exception){
    print('Get Exception');
    _exceptionSubject.add(exception);
  }
}