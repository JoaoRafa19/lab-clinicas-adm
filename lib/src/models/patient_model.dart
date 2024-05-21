import 'package:fe_lab_clinicas_adm/src/models/patient_addres_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.document,
    required this.address,
    required this.phoneNumber,
    required this.guardian,
    required this.guardianIdentificationNumber,
  });

  String id;
  String name;
  String email;
  String guardian;
  String document;

  PatientAddresModel address;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  String guardianIdentificationNumber;


  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
