class EmergencyModel{
  int emergencyId;
  String username, specificProblem, emergencyStatus;

  EmergencyModel.fromJson(Map<String, dynamic> data){
    emergencyId = data['emergency_id'];
    username = data['username'];
    specificProblem = data['specific_problem'];
    emergencyStatus = data['emergency_status'];
  }
}
