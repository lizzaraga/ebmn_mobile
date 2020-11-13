
import 'package:dio/dio.dart';
import 'package:ebmn_mobile/data/models/AbusiveSubstanceModel.dart';
import 'package:ebmn_mobile/data/models/AllergyModel.dart';
import 'package:ebmn_mobile/data/models/EkgModel.dart';
import 'package:ebmn_mobile/data/models/GeneralInfoModel.dart';
import 'package:ebmn_mobile/data/models/LabModel.dart';
import 'package:ebmn_mobile/data/models/LegalDocumentModel.dart';
import 'package:ebmn_mobile/data/models/MedicationListModel.dart';
import 'package:ebmn_mobile/data/models/ProblemModel.dart';
import 'package:ebmn_mobile/data/models/RadiologyModel.dart';
import 'package:ebmn_mobile/data/models/SurgeryModel.dart';
import 'package:ebmn_mobile/data/models/VitalSignModel.dart';

BaseOptions _options = BaseOptions(baseUrl: "https://ebasemedicalnetwork.herokuapp.com");

class PatientBoardRepo{

  final String token;
  final int patientId;
  Dio _dio = Dio(_options);
  PatientBoardRepo(this.token, this.patientId);

  Future<GeneralInfoModel> getGeneralInfos() async{
    final response =  await _dio.get('/general_info/get/$patientId/$token/');
    return GeneralInfoModel.fromJson(response.data);
  }
  
  Future<List<AbusiveSubstanceModel>> getAbusiveSubstances() async{
    final response =  await _dio.get('/abusive_substance/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['abusive_substance']);
    return mapList.map((e) => AbusiveSubstanceModel.fromJson(e)).toList(growable: false);
  }

  Future<List<AllergyModel>> getAllergies() async{
    final response =  await _dio.get('/abusive_substance/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['allergy']);
    return mapList.map((e) => AllergyModel.fromJson(e)).toList(growable: false);
  }

  Future<List<EkgModel>> getEkgs() async{
    final response =  await _dio.get('/ekg/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['ekg_result_list']);
    return mapList.map((e) => EkgModel.fromJson(e)).toList(growable: false);
  }
  
  Future<List<LabModel>> getLabs() async{
    final response =  await _dio.get('/lab/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['lab_results_list']);
    return mapList.map((e) => LabModel.fromJson(e)).toList(growable: false);
  }

  Future<List<LegalDocumentModal>> getLegalDocuments() async{
    final response =  await _dio.get('/legal_docs/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['legal_docs_list']);
    return mapList.map((e) => LegalDocumentModal.fromJson(e)).toList(growable: false);
  }

  Future<List<MedicationListModel>> getMedicationList() async{
    final response =  await _dio.get('/medication/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['medication_list']);
    return mapList.map((e) => MedicationListModel.fromJson(e)).toList(growable: false);
  }

  Future<List<ProblemModel>> getProblems() async{
    final response =  await _dio.get('/problems/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['problem_list']);
    return mapList.map((e) => ProblemModel.fromJson(e)).toList(growable: false);
  }

  Future<List<RadiologyModel>> getRadiologies() async{
    final response =  await _dio.get('/radiology/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['radiology_results_list']);
    return mapList.map((e) => RadiologyModel.fromJson(e)).toList(growable: false);
  }

  Future<List<SurgeryModel>> getSurgeries() async{
    final response =  await _dio.get('/surgery/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['surgery_results_list']);
    return mapList.map((e) => SurgeryModel.fromJson(e)).toList(growable: false);
  }

  Future<VitalSignModel> getVitalSigns() async{
    final response =  await _dio.get('/vital_signs/get/$patientId/$token/');
    final mapList = List<Map<String, dynamic>>.from(response.data['vital_signs']);
    return mapList.map((e) => VitalSignModel.fromJson(e)).toList(growable: false).first;
  }
}