import 'package:dart_appwrite/dart_appwrite.dart' show Databases;
import 'package:doctopia_helper_server/appwrite/config.dart';
import 'package:doctopia_helper_server/appwrite/function_map.dart';
import 'package:doctopia_helper_server/database_entry_helpers/models/type_size/type_size.dart';
import 'package:doctopia_helper_server/doctopia_helper_server.dart';

class ClinicCollectionScheme extends ResourceController {
  static Map<String, TypeSize> scheme = {
    'doc_id': const TypeSize(String, 100),
    'name_en': const TypeSize(String, 100),
    'name_ar': const TypeSize(String, 100),
    'venue_en': const TypeSize(String, 100),
    'venue_ar': const TypeSize(String, 100),
    'speciality_en': const TypeSize(String, 100),
    'speciality_ar': const TypeSize(String, 100),
    'gov_en': const TypeSize(String, 100),
    'gov_ar': const TypeSize(String, 100),
    'city_en': const TypeSize(String, 100),
    'city_ar': const TypeSize(String, 100),
    'mobile': const TypeSize(String, 100),
    'landline': const TypeSize(String, 100),
    'address_en': const TypeSize(String, 300),
    'address_ar': const TypeSize(String, 300),
    'location_link': const TypeSize(String, 500),
    'attendance': const TypeSize(bool, 100),
    'published': const TypeSize(bool, 100),
    'consultation_fees': const TypeSize(int, 100),
    'followup_fees': const TypeSize(int, 100),
    'discount': const TypeSize(int, 100),
    'off_dates': const TypeSize(List<String>, 100),
  };
  @Operation.get()
  Future<Response> createScheme() async {
    final client = AppConfig.client;
    final db = Databases(client);
    scheme.forEach((key, value) async {
      await createAttribute(
        type: value.type,
        databases: db,
        databaseId: AppConfig.DATABASE_CLINICS,
        collectionId: AppConfig.DATABASE_CLINICS_COLLECTION_CLINICS,
        key: key,
        size: value.size,
        xrequired: true,
      );
    });
    return Response.ok('Clinic Database clinics Collection Schema Created...');
  }
}
