class AllergyModel {
  int allergyId;
  String substance;
  String category;
  String reactionType;
  String severity;
  String allergyStatus;
  String dateFirstRecorded;
  String comments;

  AllergyModel.fromJson(Map<String, dynamic> data){
    allergyId = data['allergy_id'];
    substance = data['substance'];
    category = data['category'];
    reactionType = data['reaction_type'];
    severity = data['severity'];
    allergyStatus = data['allergy_status'];
    dateFirstRecorded = data['date_first_recorded'];
    comments = data['comments'];
  }
}


