class AbusiveSubstanceModel{
  int substanceId;
  String substance;
  String substanceDetails;
  String comments;
  String status;

  
  AbusiveSubstanceModel.fromJson(Map<String, dynamic> data){
    this.substanceId = data['substance_id'];
    this.substance = data['substance'];
    this.substanceDetails = data['substance_details'];
    this.comments = data['comments'];
    this.status = data['status'];
  }
}
