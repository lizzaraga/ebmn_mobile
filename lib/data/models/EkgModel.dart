class EkgModel{
  int ekgId;
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

  EkgModel.fromJson(Map<String, dynamic> data){
    ekgId = data['ekg_id'];
    loincCode = data['ekg_loinc_code'];
    description = data['ekg_description'];
    dateIssued = data['ekg_date_issued'];
    dateLastModified = data['ekg_date_last_modified'];
    orderInstructions = data['ekg_order_instructions'];
    orderedAt = data['ekg_ordered_at'];
    doneAt = data['ekg_done_at'];
    results = data['ekg_results'];
    units = data['ekg_units'];
    resultsInstructions = data['ekg_results_instructions'];
    abnormalFlag = data['ekg_abnormal_flag'];
    resultsProblemsList = List.from(data['ekg_results_problems_list']).map((e) => e as String).toList(growable: false);
    documentUploadUrl = data['ekg_document_upload_url'];
  }
}
