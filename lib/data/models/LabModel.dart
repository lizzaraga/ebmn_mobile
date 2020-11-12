class LabModel {
  int labId;
  String loincCode;
  String description;
  String dateIssued;
  String dateLastModified;
  String orderInstructions;
  String orderedAt;
  String doneAt;
  String results;
  String units;
  String resultsInstructions;
  String abnormalFlag;
  List<String> resultsProblemsList;
  String documentUploadUrl;

  LabModel.fromJson(Map<String, dynamic> data){
    labId = data['lab_id'];
    loincCode = data['lab_loinc_code'];
    description = data['lab_description'];
    dateIssued = data['lab_date_issued'];
    dateLastModified = data['lab_date_last_modified'];
    orderInstructions = data['lab_order_instructions'];
    orderedAt = data['lab_ordered_at'];
    doneAt = data['lab_done_at'];
    results = data['lab_results'];
    units = data['lab_units'];
    resultsInstructions = data['lab_results_instructions'];
    abnormalFlag = data['lab_abnormal_flag'];
    resultsProblemsList = List.from(data['lab_results_problems_list']).map((e) => e as String).toList(growable: false);
    documentUploadUrl = data['lab_document_upload_url'];
  }
}