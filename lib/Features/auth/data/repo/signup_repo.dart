import 'package:quent/Features/auth/data/data_source/auth_data_source.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/services/network/api_result.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/models/paginated_response.dart';

class SignupRepo {
  final AuthDataSource authDataSource;
  SignupRepo({required this.authDataSource});

  Future<ApiResult<PaginatedResponse<CountryModel>>> fetchCountries(
    int page,
    String search,
  ) async {
    try {
      final response = await authDataSource.fetchCountries(
        page: page,
        search: search,
      );
      return ApiResult.success(
        PaginatedResponse<CountryModel>.fromPage(
          data: response.data,
          totalCount: response.meta.total,
          currentPage: response.meta.currentPage,
          pageSize: response.meta.perPage,
        ),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
