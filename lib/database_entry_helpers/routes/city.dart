import 'dart:convert';

import 'package:dart_appwrite/dart_appwrite.dart' show Databases, ID;
import 'package:doctopia_helper_server/appwrite/config.dart';
import 'package:doctopia_helper_server/doctopia_helper_server.dart';
import 'package:doctopia_helper_server/database_entry_helpers/models/city.dart';
import 'package:doctopia_helper_server/database_entry_helpers/models/governorate.dart';

class CityController extends ResourceController {
  Future<List<City>> _loadJsonCity() async {
    final List<City> cities = [];
    final input = await File('./gov.json').readAsString();
    final map = jsonDecode(input);
    final List<Governorate> _govs =
        (map as List<dynamic>).map(Governorate.fromJson).toList();
    _govs.map((g) {
      cities.addAll(g.cities);
    }).toList();
    return cities;
  }

  List<City> _cities = [];

  @Operation.get()
  Future<Response> addCitiesToAppWrite() async {
    _cities = await _loadJsonCity();
    final client = AppConfig.client;
    final Databases db = Databases(client);
    try {
      _cities.forEach((element) async {
        await db.createDocument(
          databaseId: AppConfig.DATABASE_CONSTANT,
          collectionId: AppConfig.DATABASE_CONSTANT_CITIES,
          documentId: ID.unique(),
          data: element.toJson(),
        );
      });
      return Response.ok('Complete');
    } catch (e) {
      return Response.serverError(body: e.toString());
    }
  }
}
