class JobUser{
  String job;

  JobUser.fromJson(Map<String, dynamic> data){
    job = data['job'];
  }
}