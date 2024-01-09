import 'package:dart_appwrite/dart_appwrite.dart' show Databases;
import 'package:doctopia_helper_server/appwrite/config.dart';
import 'package:doctopia_helper_server/appwrite/function_map.dart';
import 'package:doctopia_helper_server/doctopia_helper_server.dart';

class DoctorCollectionScheme extends ResourceController {
  static const Map<String, Type> scheme = {
    'synd_id': int,
    "joined_at": String,
    'name_en': String,
    'name_ar': String,
    'personal_phone': String,
    'assistant_phone': String,
    'email': String,
    'salt': String,
    'password': String,
    'speciality_en': String,
    'speciality_ar': String,
    'published': bool,
    'titles_en': List<String>,
    'titles_ar': List<String>,
    "about_en": String,
    "about_ar": String,
    "degree_en": String,
    "degree_ar": String,
  };
  @Operation.get()
  Future<Response> createScheme() async {
    final client = AppConfig.client;
    final db = Databases(client);
    scheme.forEach((key, value) async {
      await createAttribute(
        type: value,
        databases: db,
        databaseId: AppConfig.DATABASE_DOCTORS,
        collectionId: AppConfig.DATABASE_DOCTORS_COLLECTION_DOCTORS,
        key: key,
        size: 50,
        xrequired: true,
      );
    });
    return Response.ok('Doctor Database doctors Collection Schema Created...');
  }
}
