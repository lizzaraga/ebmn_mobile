class VitalSignModel{
  String height;
  String weight, bodyMassIndex, waistCircumference, headCircumference,
  temperature, pulse, respiratoryRate, painScale, pregnancyMonth, muac, 
  oxygenFlowRate, systolicBp, diastolicBp, dateOfUpdate;

  VitalSignModel.fromJson(Map<String, dynamic> data){
    height = data['height'];
    weight = data['weight'];
    bodyMassIndex = data['body_mass_index'];
    waistCircumference = data['waist_circumference'];
    headCircumference = data['head_circumference'];
    temperature = data['temperature'];
    pulse = data['pulse'];
    respiratoryRate = data['respiratory_rate'];
    painScale = data['pain_scale'];
    pregnancyMonth = data['pregnancy_month'];
    muac = data['muac'];
    oxygenFlowRate = data['oxygen_flow_rate'];
    systolicBp = data['systolic_bp'];
    diastolicBp = data['diastolic_bp'];
    dateOfUpdate = data['date_of_update'];
  }
}
