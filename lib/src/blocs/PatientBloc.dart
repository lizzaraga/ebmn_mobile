import 'package:ebmn_mobile/data/models/GeneralInfoModel.dart';
import 'package:ebmn_mobile/data/models/LabModel.dart';
import 'package:ebmn_mobile/data/models/LegalDocumentModel.dart';
import 'package:ebmn_mobile/data/models/auth/AuthUser.dart';
import 'package:ebmn_mobile/main.dart';
import 'package:ebmn_mobile/src/blocs/ExceptionBloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class PatientBloc extends ExceptionBloc{
  BehaviorSubject<GeneralInfoModel> _generalInfoSubject = BehaviorSubject();
  ValueStream<GeneralInfoModel> get generalInfoStream => _generalInfoSubject.stream;

  BehaviorSubject<List<LegalDocumentModel>> _legalDocumentsSubject = BehaviorSubject();
  ValueStream<List<LegalDocumentModel>> get legalDocumentsStream => _legalDocumentsSubject.stream;

  BehaviorSubject<List<LabModel>> _labsSubject = BehaviorSubject();
  ValueStream<List<LabModel>> get labsStream => _labsSubject.stream;

  Future<void> getGeneralInfo(AuthUser user) async{
    try {
      final response =  await dio.get('/general_info/get/${user.id}/${user.token}/');
      print(response.data);
      final data = GeneralInfoModel.fromJson(response.data);
      _generalInfoSubject.add(data);
    } catch (e) {
      _generalInfoSubject.add(e);
    }
  }

  Future<void> getLegalDocuments(AuthUser user) async{
    try {
      final response =  await dio.get('/legal_docs/get/${user.id}/${user.token}/');
      print(response.data);
      final mapList = List<Map<String, dynamic>>.from(response.data['legal_docs_list']);
      _legalDocumentsSubject.add(mapList.map((e) => LegalDocumentModel.fromJson(e)).toList(growable: false));
    } catch (e) {
      _legalDocumentsSubject.add(e);
    }
  }

  Future<void> getLabs(AuthUser user) async{
    try {
      final response =  await dio.get('/lab/get/${user.id}/${user.token}/');
      print(response.data);
      final mapList = List<Map<String, dynamic>>.from(response.data['lab_results_list']);
      _labsSubject.add(mapList.map((e) => LabModel.fromJson(e)).toList(growable: false));
    } catch (e) {
      _labsSubject.add(e);
    }
  }
    

  @override
  dispose() {
    super.dispose();
    _generalInfoSubject.close();
    _legalDocumentsSubject.close();
    _labsSubject.close();
  }
}