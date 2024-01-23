import 'package:doctopia_helper_server/database_entry_helpers/routes/city.dart';
import 'package:doctopia_helper_server/database_entry_helpers/routes/clinic_collection_scheme.dart';
import 'package:doctopia_helper_server/database_entry_helpers/routes/doctor_collection_scheme.dart';
import 'package:doctopia_helper_server/database_entry_helpers/routes/gov.dart';
import 'package:doctopia_helper_server/database_entry_helpers/routes/spec.dart';
import 'package:doctopia_helper_server/doctopia_helper_server.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://conduit.io/docs/http/channel/.
class DoctopiaHelperServerChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://conduit.io/docs/http/request_controller/
    router.route("/gov").link(GovernorateController.new);
    router.route("/city").link(CityController.new);
    router.route("/spec").link(SpecialityController.new);
    router.route("/doc-scheme").link(DoctorCollectionScheme.new);
    router.route("/clinic-scheme").link(ClinicCollectionScheme.new);

    return router;
  }
}
