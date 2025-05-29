import 'package:emaar/core/services/supabase_database_service.dart';
import 'package:get_it/get_it.dart';
import '../repos/estate_repo/estate_repo.dart';
import '../repos/estate_repo/estate_repo_impl.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    // Register Supabase service
    getIt.registerSingleton<SupabaseDatabaseService>(SupabaseDatabaseService());

    // Register EstateRepo
    getIt.registerSingleton<EstateRepo>(
      EstateRepoImpl(supabaseDatabaseService: getIt<SupabaseDatabaseService>()),
    );
  }
}
