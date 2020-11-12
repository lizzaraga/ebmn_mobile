class GeneralInfoModel{
  String username;
  String email;
  String phoneNumber;
  String title;
  String firstName; String middleName;
  String lastName; String suffix;
  String alternateEmail; String officePhone;
  String patientId; String placeOfBirth;
  String sex; String race;
  String ethnicity; String language;
  String occupation; String religion;
  String maritalStatus; String interpreterNeeded;
  String regionOfResidence; String numberOfChildren;
  String employerName; String bloodType;
  String gpsLongitude; String gpsLatitude;
  String residenceSite; String preferredCommunicationChannel;
  String dateOfBirth; String signatureFileUrl; String photoUrl;
  String houseMapUrl; List<String> emergencyContacts;

  GeneralInfoModel.fromJson(Map<String, dynamic> data){
    username = data['username']; email = data['email'];
    phoneNumber = data['phone_number']; title = data['title'];
    firstName = data['first_name']; middleName = data['middle_name'];
    lastName = data['last_name']; suffix = data['suffix'];
    alternateEmail = data['alternate_email'];
    officePhone = data['office_phone'];
    patientId = data['patient_id']; placeOfBirth = data['place_of_birth'];
    sex = data['sex']; race = data['race']; ethnicity = data['ethnicity'];
    language = data['lanaguage']; occupation = data['occupation'];
    religion = data['religion']; maritalStatus = data['marital_status'];
    interpreterNeeded = data['interpreter_needed'];
    regionOfResidence = data['region_of_residence'];
    numberOfChildren = data['number_of_children'];
    employerName = data['employer_name']; bloodType = data['blood_type'];
    gpsLongitude = data['gps_longitude']; gpsLatitude = data['gps_latitude'];
    residenceSite = data['residence_site'];
    preferredCommunicationChannel = data['preferred_communication_channel'];
    dateOfBirth = data['date_of_birth'];
    signatureFileUrl = data['signature_file'];
    photoUrl = data['photo'];
    houseMapUrl = data['house_map'];
    emergencyContacts = List.from(data['emergency_contacts']).map((e) => e as String).toList(growable: false);
  }
}

