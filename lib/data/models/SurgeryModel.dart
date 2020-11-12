class SurgeryModel{
  int surgeryId;
  String cptCode;
  String description;
  String anaestasia;
  String frozenSectionPathology;
  String date;
  String legalDocumentUrl, orderedAt, healthInstituteDispenser, orderedOn, commentsBefore,
  commentsAfter, response;
  List<String> resultsProblemsList;

  SurgeryModel.fromJson(Map<String, dynamic> data){
    surgeryId = data['surgery_id'];
    cptCode = data['surgery_cpt_code'];
    description = data['surgery_description'];
    anaestasia = data['surgery_anaestasia'];
    frozenSectionPathology = data['surgery_frozen_section_pathology'];
    date = data['surgery_date'];
    legalDocumentUrl = data['surgery_legal_document_approval'];
    orderedAt = data['surgery_ordered_at'];
    healthInstituteDispenser = data['surgery_health_institute_dispenser'];
    orderedOn = data['surgery_ordered_on'];
    commentsBefore = data['surgery_before'];
    commentsAfter = data['surgery_comments_after'];
    response = data['surgery_response'];
    resultsProblemsList = List.from(data['surgery_result_problem_list']).map((e) => e as String).toList(growable: false);
  }
}

