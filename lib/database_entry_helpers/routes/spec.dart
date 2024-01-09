import 'package:dart_appwrite/dart_appwrite.dart' show Databases, ID;
import 'package:doctopia_helper_server/appwrite/config.dart';
import 'package:doctopia_helper_server/doctopia_helper_server.dart';
import 'package:doctopia_helper_server/database_entry_helpers/models/speciality.dart';

class SpecialityController extends ResourceController {
  @Operation.get()
  Future<Response> addCitiesToAppWrite() async {
    final specs = Speciality.list;
    final client = AppConfig.client;
    final Databases db = Databases(client);
    try {
      specs.forEach((element) async {
        await db.createDocument(
          databaseId: AppConfig.DATABASE_CONSTANT,
          collectionId: AppConfig.DATABASE_CONSTANT_COLLECTION_SPECIALITIES,
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
