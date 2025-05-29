import 'package:emaar/core/errors/exceptions.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supported filter operators for querying
enum FilterOperator { eq, neq, lt, lte, gt, gte, like, ilike }

/// Represents a single filter condition on a table column
class FilterCondition {
  final String column;
  final FilterOperator operator;
  final dynamic value;

  const FilterCondition({
    required this.column,
    required this.operator,
    required this.value,
  });
}

/// A professional service class to interact with Supabase DB
class SupabaseDatabaseService {
  /// Fetches all rows from [table]
  Future<List<Map<String, dynamic>>> fetch({required String table}) async {
    try {
      final response = await Supabase.instance.client.from(table).select();
      return response;
    } on PostgrestException catch (e) {
      debugPrint('[Supabase ERROR] ${e.message}');
      throw CustomException(
        message: 'Error fetching data from "$table": ${e.message}',
      );
    } catch (e, st) {
      debugPrint('[Unexpected ERROR] $e');
      debugPrint('$st');
      throw CustomException(
        message: 'Unexpected error fetching data from "$table"',
      );
    }
  }

  /// Fetches rows from [table] using simple equality filters
  Future<List<Map<String, dynamic>>> fetchFiltered({
    required String table,
    required Map<String, dynamic> filters,
  }) async {
    try {
      var query = Supabase.instance.client.from(table).select();
      filters.forEach((column, value) {
        query = query.eq(column, value);
      });
      final response = await query;
      return (response as List).cast<Map<String, dynamic>>();
    } on PostgrestException catch (e) {
      debugPrint('[Supabase ERROR] ${e.message}');
      throw CustomException(
        message: 'Error fetching filtered data from "$table": ${e.message}',
      );
    } catch (e, st) {
      debugPrint('[Unexpected ERROR] $e');
      debugPrint('$st');
      throw CustomException(
        message: 'Unexpected error fetching filtered data from "$table"',
      );
    }
  }

  /// Fetches rows from [table] using advanced [filters]
  /// Supports multiple operators and values.
  Future<List<Map<String, dynamic>>> fetchWithFilters({
    required String table,
    required List<FilterCondition> filters,
  }) async {
    try {
      var query = Supabase.instance.client.from(table).select();
      for (final filter in filters) {
        switch (filter.operator) {
          case FilterOperator.eq:
            query = query.eq(filter.column, filter.value);
            break;
          case FilterOperator.neq:
            query = query.neq(filter.column, filter.value);
            break;
          case FilterOperator.lt:
            query = query.lt(filter.column, filter.value);
            break;
          case FilterOperator.lte:
            query = query.lte(filter.column, filter.value);
            break;
          case FilterOperator.gt:
            query = query.gt(filter.column, filter.value);
            break;
          case FilterOperator.gte:
            query = query.gte(filter.column, filter.value);
            break;
          case FilterOperator.like:
            query = query.like(filter.column, filter.value);
            break;
          case FilterOperator.ilike:
            query = query.ilike(filter.column, filter.value);
            break;
        }
      }
      final response = await query;
      return (response as List).cast<Map<String, dynamic>>();
    } on PostgrestException catch (e) {
      debugPrint('[Supabase ERROR] ${e.message}');
      throw CustomException(
        message: 'Error fetching with filters from "$table": ${e.message}',
      );
    } catch (e, st) {
      debugPrint('[Unexpected ERROR] $e');
      debugPrint('$st');
      throw CustomException(
        message: 'Unexpected error fetching with filters from "$table"',
      );
    }
  }

  /// Fetches paginated rows from [table] with optional ordering and filters
  ///
  /// [page] starts from 1, [perPage] is items per page.
  /// [orderBy] can specify a column and ascending/descending.
  Future<List<Map<String, dynamic>>> fetchPaginated({
    required String table,
    int page = 1,
    int perPage = 10,
    String? orderByColumn,
    bool ascending = true,
    List<FilterCondition>? filters,
  }) async {
    try {
      final from = (page - 1) * perPage;
      final to = from + perPage - 1;
      var query = Supabase.instance.client.from(table).select();

      // Apply filters if any
      if (filters != null) {
        for (final filter in filters) {
          switch (filter.operator) {
            case FilterOperator.eq:
              query = query.eq(filter.column, filter.value);
              break;
            case FilterOperator.neq:
              query = query.neq(filter.column, filter.value);
              break;
            case FilterOperator.lt:
              query = query.lt(filter.column, filter.value);
              break;
            case FilterOperator.lte:
              query = query.lte(filter.column, filter.value);
              break;
            case FilterOperator.gt:
              query = query.gt(filter.column, filter.value);
              break;
            case FilterOperator.gte:
              query = query.gte(filter.column, filter.value);
              break;
            case FilterOperator.like:
              query = query.like(filter.column, filter.value);
              break;
            case FilterOperator.ilike:
              query = query.ilike(filter.column, filter.value);
              break;
          }
        }
      }
      PostgrestTransformBuilder<PostgrestList> queryWithPagination = query;

      // Apply ordering
      if (orderByColumn != null) {
        queryWithPagination = queryWithPagination.order(
          orderByColumn,
          ascending: ascending,
        );
      }

      // Apply range for pagination
      queryWithPagination = queryWithPagination.range(from, to);

      final response = await queryWithPagination;
      return (response as List).cast<Map<String, dynamic>>();
    } on PostgrestException catch (e) {
      debugPrint('[Supabase ERROR] ${e.message}');
      throw CustomException(
        message: 'Error fetching paginated data from "$table": ${e.message}',
      );
    } catch (e, st) {
      debugPrint('[Unexpected ERROR] $e');
      debugPrint('$st');
      throw CustomException(
        message: 'Unexpected error fetching paginated data from "$table"',
      );
    }
  }
}
