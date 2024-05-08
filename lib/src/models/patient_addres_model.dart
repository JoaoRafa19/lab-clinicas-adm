import 'package:json_annotation/json_annotation.dart';

part 'patient_addres_model.g.dart';

@JsonSerializable()
class PatientAddresModel {
  PatientAddresModel({
    required this.cep,
    required this.streetAddress,
    required this.number,
    required this.addressComplement,
    required this.state,
    required this.city,
    required this.district,
  });

  @JsonKey(name: 'cep', defaultValue: '')
  String cep;
  @JsonKey(name: 'street_address')
  String streetAddress;
  String number;
  @JsonKey(name: 'address_complement')
  String addressComplement;
  String state;
  String city;
  String district;

  factory PatientAddresModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddresModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddresModelToJson(this);
}
