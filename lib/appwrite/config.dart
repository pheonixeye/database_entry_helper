// ignore_for_file: constant_identifier_names

import 'package:dart_appwrite/dart_appwrite.dart';

class AppConfig {
  static const String ENDPOINT = 'http://localhost:4567/v1';
  //-------------------------------------------------------------------//
  static const String PROJECT = '65971012f07082d8ab5b';
  //-------------------------------------------------------------------//
  static const String API_KEY =
      '48496acdfd3010e4f526a886d288cf33fa4352d9368d58e4128c62547a4543b6aeb733f01b446ed9c48243a10e6102f8f42a78508c18520da1837bd6e2be8749a8d2d27937113da0c04952d0a44ae5108ffd505888b33fe6277697534e1cec65160299c2d2343c7b693289668afd270712ddffede50be992c2e8fc19c3e7872b';
  //-------------------------------------------------------------------//
  static const String DATABASE_CONSTANT = "659712fb491b78a6a3eb";
  static const String DATABASE_DOCTORS = "6597130537d821724e3a";
  static const String DATABASE_CLINICS = "6597130e75340bbe78b5";
  //-------------------------------------------------------------------//
  static const String DATABASE_CONSTANT_COLLECTION_GOVERNORATES =
      "65971420ddeab946eabd";
  static const String DATABASE_CONSTANT_COLLECTION_CITIES =
      "6597142a156512c1b5fa";
  static const String DATABASE_CONSTANT_COLLECTION_SPECIALITIES =
      "6597143473d5a3144e13";
  static const String DATABASE_DOCTORS_COLLECTION_DOCTORS =
      "65993582811a4a88e828";
  static const String DATABASE_CLINICS_COLLECTION_CLINICS =
      "659c20de23dc45c0bd70";
  //-------------------------------------------------------------------//

  static final Client _client = Client(
    endPoint: ENDPOINT,
  ).setProject(PROJECT).setKey(API_KEY);

  static Client get client => _client;
}
