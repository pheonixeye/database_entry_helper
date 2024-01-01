// ignore_for_file: constant_identifier_names

import 'package:dart_appwrite/dart_appwrite.dart';

class AppConfig {
  static const String ENDPOINT = 'http://localhost:4567/v1';
  //-------------------------------------------------------------------//
  static const String PROJECT = '6592d477367f9542e185';
  //-------------------------------------------------------------------//
  static const String API_KEY =
      '9e67ed190470bf230cc6e78ba506f40d1654ec17b7fae28eb599ee8990b69fb56ca5a0624e19be6d397a165ab9cc0ced07920771a40caf071a697fd0c5a6b5588bf22678aa0f9c24ca49a19e727283be0a3477bca29cc30610b5e23fe42292f97f9c475d924955283e2f11926901fece659d1e5c7f99ebbea030ffc877e2b825';
  //-------------------------------------------------------------------//
  static const String DATABASE_CONSTANT = "65932ca2907ad310527d";
  //-------------------------------------------------------------------//
  static const String DATABASE_CONSTANT_GOVERNORATES = "65932cd1373d723a5a6f";
  static const String DATABASE_CONSTANT_CITIES = "65932d614cd2d7394ff0";
  static const String DATABASE_CONSTANT_SPECIALITIES = "65932e5461c932307c55";
  //-------------------------------------------------------------------//

  static final Client _client = Client(
    endPoint: ENDPOINT,
  ).setProject(PROJECT).setKey(API_KEY);

  static Client get client => _client;
}
