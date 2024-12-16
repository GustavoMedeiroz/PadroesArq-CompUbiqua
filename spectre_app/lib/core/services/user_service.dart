import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/utils/spectre_url.dart';
import '../models/page.dart';
import '../models/user_model.dart';

class UserService {
  static final String userPath = '${SpectreUrl.baseUrl}/user';

  Future<Page<UserModel>> findAll({int page = 1, int size = 10}) async {
    final url = Uri.http(
      userPath,
      '/all',
      { 'page': '$page', 'size': '$size' },
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return Page.fromJson(
        responseJson,
        (data) => UserModel.fromJson(data),
      );
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<UserModel> findById(int id) async {
    final url = Uri.http(userPath, '/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return UserModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<UserModel> create(UserModel userModel) async {
    final url = Uri.http(userPath);
    final response = await http.post(
      url,
      body: jsonEncode(userModel.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return UserModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<UserModel> update(UserModel userModel) async {
    final url = Uri.http(userPath);
    final response = await http.put(
      url,
      body: jsonEncode(userModel.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return UserModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<void> delete(int id) async {
    final url = Uri.http(userPath, '/$id');
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }
}