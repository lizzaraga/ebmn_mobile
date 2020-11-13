class LegalDocumentModel{
  int documentId;
  String category;
  String dateOfEstablishment;
  String decisionDate;
  String reasonForCapacity;
  String reasonForDetermination;
  String legalDocumentUrl;

  LegalDocumentModel.fromJson(Map<String, dynamic> data){
    documentId = data['document_id'];
    category = data['document_category'];
    dateOfEstablishment = data['document_date_of_establishment'];
    decisionDate = data['document_decision_date'];
    reasonForCapacity = data['document_reason_for_capacity'];
    reasonForDetermination = data['document_reason_for_determination'];
    legalDocumentUrl = data['document_legal_document'];
  }
}
