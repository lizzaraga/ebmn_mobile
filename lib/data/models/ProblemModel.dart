class ProblemModel{
  int problemId;
  String icdCode;
  String name;
  String organSystem;
  String dateOnset;
  String currentStatus;
  String priority;
  String diagnosedAt;
  String treatmentAt;

  ProblemModel.fromJson(Map<String, dynamic> data){
    problemId = data['problem_id'];
    icdCode = data['problem_icd'];
    name = data['problem_name'];
    organSystem = data['problem_organ_system'];
    dateOnset = data['problem_date_onset'];
    currentStatus = data['problem_current_status'];
    priority = data['problem_priority'];
    diagnosedAt = data['problem_diagnosed_at'];
    treatmentAt = data['problem_treatment_at'];
    
  }
}
