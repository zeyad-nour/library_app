import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final String _apiKey = 'AIzaSyCSKZKZAun4b11OsTAM2q9Bl4tmoKClUhc';

  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint&key=$_apiKey',
    );

    return response.data;
  }
}