import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/utils/spectre_url.dart';
import '../../models/page.dart';
import '../../models/sensor_model.dart';

class SensorService {
  static final String sensorPath = '/sensor';

  Future<Page<SensorModel>> findAll(int page, List<String> types) async {
    print(types);

    final queryParameters = {
      'page': '$page',
      'size': '10',
      'types': types.join(','),
    };

    print(queryParameters);

    final url = Uri.http(
      SpectreUrl.baseUrl,
      sensorPath,
      queryParameters,
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return Page.fromJson(
        responseJson,
        (data) => SensorModel.fromJson(data),
      );
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<SensorModel> findById(int id) async {
    final url = Uri.http(SpectreUrl.baseUrl, '$sensorPath/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return SensorModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<SensorModel> create(SensorModel sensorModel) async {
    final url = Uri.http(SpectreUrl.baseUrl, sensorPath);
    final response = await http.post(
      url,
      body: jsonEncode(sensorModel.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return SensorModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<SensorModel> update(SensorModel sensorModel) async {
    final url = Uri.http(SpectreUrl.baseUrl, sensorPath);
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(sensorModel.toJson()),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return sensorModel;
    } else {
      String errorMessage;
      try {
        final errorResponse = jsonDecode(response.body);
        errorMessage = errorResponse['message'];
      } catch (e) {
        errorMessage = 'Erro desconhecido: ${response.body}';
      }
      throw Exception('Error response: $errorMessage');
    }
  }

  Future<void> delete(int id) async {
    final url = Uri.http(SpectreUrl.baseUrl, '$sensorPath/$id');
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }
}
