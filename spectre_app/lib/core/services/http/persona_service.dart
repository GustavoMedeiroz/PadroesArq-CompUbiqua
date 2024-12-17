import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/utils/spectre_url.dart';
import '../../models/page.dart';
import '../../models/persona_model.dart';

class PersonaService {
  static final String personaPath = '${SpectreUrl.baseUrl}/persona';

  Future<Page<PersonaModel>> findAll({int page = 1, int size = 10}) async {
    final url = Uri.http(
      personaPath,
      '/all',
      {'page': '$page', 'size': '$size'},
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return Page.fromJson(
        responseJson,
        (data) => PersonaModel.fromJson(data),
      );
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<PersonaModel> findById(int id) async {
    final url = Uri.http(personaPath, '/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return PersonaModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<PersonaModel> create(PersonaModel personaModel) async {
    final url = Uri.http(personaPath);
    final response = await http.post(
      url,
      body: jsonEncode(personaModel.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return PersonaModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<PersonaModel> update(PersonaModel personaModel) async {
    final url = Uri.http(personaPath);
    final response = await http.put(
      url,
      body: jsonEncode(personaModel.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return PersonaModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<void> delete(int id) async {
    final url = Uri.http(personaPath, '/$id');
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }
}
