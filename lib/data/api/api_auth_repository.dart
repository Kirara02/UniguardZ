import 'package:dio/dio.dart';
import 'package:uniguard_z/data/repositories/auth_repository.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/user.dart';
import 'package:uniguard_z/presentation/misc/api_client.dart';
import 'package:uniguard_z/presentation/misc/token_helper.dart';

class ApiAuthRepository implements AuthRepository {
  late final ApiClient _apiClient;

  ApiAuthRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  @override
  Future<bool> getLoggedInUser() async {
    return await TokenHelper().getLoginStatus();
  }

  @override
  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      // final response = await _apiClient.post(
      //   "/user/login",
      //   data: {
      //     "username": email,
      //     "password": password,
      //   },
      // );

      // if (response.statusCode == 200) {
      //   TokenHelper().setToken(response.data['token']);
      TokenHelper().setLoginStatus(true);

      return Result.success(
          User(id: 1, name: "Kirara Bernstein", email: "kirara@gmail.com"));
      // } else {
      //   return const Result.failed("Failed to login");
      // }
    } on DioException catch (e) {
      // printIfDebug(e.error.toString());
      return Result.failed(e.response?.data['message'].toString() ?? "");
    }
  }

  @override
  Future<Result<String>> logout() async {
    TokenHelper().setLoginStatus(false);
    TokenHelper().setToken(null);
    return const Result.success("Logout Success");
  }
}
