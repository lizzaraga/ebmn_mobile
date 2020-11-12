class GeneralInfoRepo{
  static GeneralInfoRepo _instance;
  GeneralInfoRepo._internal();

  factory GeneralInfoRepo(){
    _instance =  GeneralInfoRepo._internal();
    return _instance;
  }

  
}