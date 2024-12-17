import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/utils/spectre_url.dart';
import '../../models/information_model.dart';
import '../../models/page.dart';

class InformationService {
  static final String informationPath = '${SpectreUrl.baseUrl}/information';

  Future<Page<InformationModel>> findAll({int page = 1, int size = 10}) async {
    final url = Uri.http(
      informationPath,
      '/all',
      {'page': '$page', 'size': '$size'},
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return Page.fromJson(
        responseJson,
        (data) => InformationModel.fromJson(data),
      );
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<InformationModel> findById(int id) async {
    final url = Uri.http(informationPath, '/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return InformationModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<InformationModel> create(InformationModel informationModel) async {
    final url = Uri.http(informationPath);
    final response = await http.post(
      url,
      body: jsonEncode(informationModel.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return InformationModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<InformationModel> update(InformationModel informationModel) async {
    final url = Uri.http(informationPath);
    final response = await http.put(
      url,
      body: jsonEncode(informationModel.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return InformationModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<void> delete(int id) async {
    final url = Uri.http(informationPath, '/$id');
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }
}
