class JobUser{
  int patientId;
  String job;

  JobUser.fromJson(Map<String, dynamic> data){
    patientId = data['patient_id'];
    job = data['job'];
  }
}