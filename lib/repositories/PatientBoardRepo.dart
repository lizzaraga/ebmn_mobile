
import 'package:dio/dio.dart';
import 'package:ebmn_mobile/data/models/GeneralInfoModel.dart';

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
  
}