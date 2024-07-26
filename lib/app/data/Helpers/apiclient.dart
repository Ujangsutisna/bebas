import 'package:bebas/app/data/Helpers/user_info.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://kkn.proyek.org/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 6)));
final userInfo = UserInfo();

Token() async {
  String? token = await UserInfo().getToken();
  return token;
}

class ApiClient {
  Future<Response> get(String path) async {
    try {
      final dataToken = await Token();
      print(dataToken);
      final token = await userInfo.getToken();
      final response = await dio.get(Uri.encodeFull(path),
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
              'X-Requested-With': 'XMLHttpRequest',
            },
            validateStatus: (status) {
              return status != null &&
                  (status >= 200 && status < 300 ||
                      status == 404 ||
                      status == 403);
            },
          ));

      if (response.statusCode == 403 || response.statusCode == 401) {
        UserInfo().logout();
      }

      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final dataToken = await Token();
      print(dataToken);
      final response = await dio.post(Uri.encodeFull(path),
          data: data,
          options: Options(
              headers: {
                'Authorization': 'Bearer $dataToken',
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type': 'application/json'
              },
              validateStatus: (status) {
                print(status);
                return status != null &&
                    (status >= 200 && status < 300 ||
                        status == 400 ||
                        status == 404 ||
                        status == 403);
              }));
      print('status code ni${response.statusCode}');
      if (response.statusCode == 403 ||response.statusCode == 401) {
        UserInfo().logout();
      }
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await dio.put(Uri.encodeFull(path), data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.get(Uri.encodeFull(path));
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
