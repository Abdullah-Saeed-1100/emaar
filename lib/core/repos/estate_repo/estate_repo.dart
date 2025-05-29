import 'package:dartz/dartz.dart';
import '../../entities/property_entity.dart';
import '../../errors/failures.dart';

abstract class EstateRepo {
  Future<Either<Failure, List<PropertyEntity>>> getAllEstates({
    required String tableName,
  });
}
