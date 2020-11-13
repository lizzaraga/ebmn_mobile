import 'package:ebmn_mobile/data/models/AbusiveSubstanceModel.dart';
import 'package:ebmn_mobile/data/models/AllergyModel.dart';
import 'package:ebmn_mobile/data/models/EkgModel.dart';
import 'package:ebmn_mobile/data/models/GeneralInfoModel.dart';
import 'package:ebmn_mobile/data/models/LabModel.dart';
import 'package:ebmn_mobile/data/models/LegalDocumentModel.dart';
import 'package:ebmn_mobile/data/models/MedicationListModel.dart';
import 'package:ebmn_mobile/data/models/ProblemModel.dart';
import 'package:ebmn_mobile/data/models/RadiologyModel.dart';
import 'package:ebmn_mobile/data/models/SurgeryModel.dart';
import 'package:ebmn_mobile/data/models/VitalSignModel.dart';
import 'package:ebmn_mobile/providers/authProvider.dart';
import 'package:ebmn_mobile/repositories/PatientBoardRepo.dart';
import 'package:hooks_riverpod/all.dart';

final _patientBoardRepoProvider = Provider<PatientBoardRepo>((ref){
  final token = ref.read(authUserProvider).state.token;
  final patientId = ref.read(jobUserProvider).state.patientId;
  return PatientBoardRepo(token, patientId);
});

final generalInfoProvider = FutureProvider.autoDispose<GeneralInfoModel>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getGeneralInfos();
});

final abusiveSubstanceProvider = FutureProvider.autoDispose<List<AbusiveSubstanceModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getAbusiveSubstances();
});

final allergiesProvider = FutureProvider.autoDispose<List<AllergyModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getAllergies();
});

final ekgsProvider = FutureProvider.autoDispose<List<EkgModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getEkgs();
});

final labsProvider = FutureProvider.autoDispose<List<LabModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getLabs();
});

final legalDocumentsProvider = FutureProvider.autoDispose<List<LegalDocumentModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getLegalDocuments();
});

final medicationListProvider = FutureProvider.autoDispose<List<MedicationListModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getMedicationList();
});

final problemsProvider = FutureProvider.autoDispose<List<ProblemModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getProblems();
});

final radiologiesProvider = FutureProvider.autoDispose<List<RadiologyModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getRadiologies();
});

final surgeriesProvider = FutureProvider.autoDispose<List<SurgeryModel>>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getSurgeries();
});

final vitalSignsProvider = FutureProvider.autoDispose<VitalSignModel>((ref) async{
  final repo = ref.read(_patientBoardRepoProvider);
  return await repo.getVitalSigns();
});