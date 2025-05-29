import 'package:dartz/dartz.dart';
import 'package:emaar/core/entities/property_entity.dart';
import 'package:emaar/core/errors/failures.dart';
import 'package:emaar/core/repos/estate_repo/estate_repo.dart';
import 'package:emaar/core/services/supabase_database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/property_model.dart';

class EstateRepoImpl implements EstateRepo {
  final SupabaseDatabaseService supabaseDatabaseService;

  EstateRepoImpl({required this.supabaseDatabaseService});
  @override
  Future<Either<Failure, List<PropertyEntity>>> getAllEstates({
    required String tableName,
  }) async {
    try {
      final response = await supabaseDatabaseService.fetch(table: tableName);
      final List<PropertyEntity> properties =
          response
              .map((item) => PropertyModel.fromJson(item).toEntity())
              .toList();
      return Right(properties);
    } on PostgrestException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'حدث خطأ غير متوقع: $e'));
    }
  }
}
