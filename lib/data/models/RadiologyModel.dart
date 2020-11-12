class RadiologyModel{
  int radiologyId;
  String loincCode;
  String description;
  String dateIssued;
  String dateLastModified;
  String orderInstructions;
  String orderedAt;
  String doneAt;
  String resultCommentary;
  String resultsInstructions;
  String abnormalFlag;
  List<String> resultsProblemsList;
  String documentUploadUrl;

  RadiologyModel.fromJson(Map<String, dynamic> data){
    radiologyId = data['radiology_id'];
    loincCode = data['radiology_loinc_code'];
    description = data['radiology_description'];
    dateIssued = data['radiology_date_issued'];
    dateLastModified = data['radiology_date_last_modified'];
    orderInstructions = data['radiology_order_instruction'];
    orderedAt = data['radiology_ordered_at'];
    doneAt = data['radiology_done_at'];
    resultCommentary = data['radiology_result_commentary'];
    resultsInstructions = data['radiology_result_instruction'];
    abnormalFlag = data['radiology_abnormal_flag'];
    resultsProblemsList = List.from(data['radiology_results_problems_list']).map((e) => e as String).toList(growable: false);
    documentUploadUrl = data['radiology_document_upload_url'];
  }
}
