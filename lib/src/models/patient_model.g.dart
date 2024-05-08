// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      document: json['document'] as String,
      address:
          PatientAddresModel.fromJson(json['address'] as Map<String, dynamic>),
      phoneNumber: json['phone_number'] as String,
      guardianIdentificationNumber:
          json['guardian_identification_number'] as String? ?? '',
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'document': instance.document,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'guardian_identification_number': instance.guardianIdentificationNumber,
    };
