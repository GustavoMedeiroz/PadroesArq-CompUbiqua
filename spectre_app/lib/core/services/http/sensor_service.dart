import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/utils/spectre_url.dart';
import '../../models/page.dart';
import '../../models/sensor_model.dart';

class SensorService {
  static final String sensorPath = '/sensor';

  Future<Page<SensorModel>> findAll(int page) async {
    int size = 10;
    final url = Uri.http(
      SpectreUrl.baseUrl,
      '$sensorPath/all',
      {'page': '$page', 'size': '$size'},
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
      body: jsonEncode(sensorModel.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return SensorModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
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
