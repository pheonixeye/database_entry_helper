import 'dart:convert';
// import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart' show Databases, ID;
import 'package:doctopia_helper_server/appwrite/config.dart';
import 'package:doctopia_helper_server/doctopia_helper_server.dart';
import 'package:doctopia_helper_server/database_entry_helpers/models/governorate.dart';

class GovernorateController extends ResourceController {
  Future<List<Governorate>> _loadJson() async {
    final input = await File('./gov.json').readAsString();
    final map = jsonDecode(input);
    return (map as List<dynamic>).map(Governorate.fromJson).toList();
  }

  List<Governorate> _govs = [];

  @Operation.get()
  Future<Response> addGovsToAppWrite() async {
    _govs = await _loadJson();
    final client = AppConfig.client;
    final Databases db = Databases(client);
    try {
      _govs.forEach((element) async {
        await db.createDocument(
          databaseId: AppConfig.DATABASE_CONSTANT,
          collectionId: AppConfig.DATABASE_CONSTANT_GOVERNORATES,
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
