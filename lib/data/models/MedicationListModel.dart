class MedicationListModel{
  int medicationid;
  String rxnormLabel;
  String route;
  String dateOrdered;
  String dateLastModified;
  String receptionStatus;
  String orderedBy;
  String dispenserHealthInstitute;
  String frequency;
  String typeOfTherapy;
  String duration;
  String instructionOnPrescription;
  String instructionOnDelivery;
  int dosage;
  String dosageUnit;
  int volumeDosage;
  String volumeDosageUnit;
  List<String> relatedProblems;

  MedicationListModel.fromJson(Map<String, dynamic> data){
    medicationid = data['medication_id'];
    rxnormLabel = data['medication_rxnorm_label'];
    route = data['medication_route'];
    dateOrdered = data['medication_date_ordered'];
    dateLastModified = data['medication_last_modified'];
    receptionStatus = data['medication_reception_status'];
    orderedBy = data['medication_ordered_by'];
    dispenserHealthInstitute = data['medication_dispenser_health_institute'];
    frequency = data['medication_frequency'];
    typeOfTherapy = data['medication_type_of_therapy'];
    duration = data['duration'];
    instructionOnPrescription = data['medication_instruction_on_prescription'];
    instructionOnDelivery = data['medication_instructions_on_delivery'];
    dosage = data['medication_dosage'];
    dosageUnit = data['medication_dosage_unit'];
    volumeDosage = data['medication_volume_dosage'];
    volumeDosageUnit = data['medication_volume_dosage_unit'];
    relatedProblems = List.from(data['medication_related_problems']).map((e) => e as String).toList(growable: false);
  }
}
