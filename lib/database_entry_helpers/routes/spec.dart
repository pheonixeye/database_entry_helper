import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:dart_appwrite/dart_appwrite.dart' show Databases, ID;
import 'package:doctopia_helper_server/appwrite/config.dart';
import 'package:doctopia_helper_server/database_entry_helpers/models/speciality.dart';
import 'package:doctopia_helper_server/doctopia_helper_server.dart';

class SpecialityController extends ResourceController {
  @Operation.get()
  Future<Response> addCitiesToAppWrite() async {
    final input = File('./specs.csv').openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    fields.removeAt(0);
    final List<Speciality> specs = [];
    for (int i = 0; i < fields.length; i++) {
      specs.add(Speciality(
          en: fields[i][0] as String, ar: fields[i][1] as String, id: i));
    }

    final List<Speciality> toAdd = specs.reversed.toList();
    final client = AppConfig.client;
    final Databases db = Databases(client);
    try {
      toAdd.forEach((element) async {
        await db.createDocument(
          databaseId: AppConfig.DATABASE_CONSTANT,
          collectionId: AppConfig.DATABASE_CONSTANT_COLLECTION_SPECIALITIES,
          documentId: ID.unique(),
          data: element.toJson(),
        );
      });
      return Response.ok(specs);
    } catch (e) {
      return Response.serverError(body: e.toString());
    }
  }
}
