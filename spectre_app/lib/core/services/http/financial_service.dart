import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/utils/spectre_url.dart';
import '../../models/financial_model.dart';
import '../../models/page.dart';

class FinancialService {
  static final String financialPath = '${SpectreUrl.baseUrl}/financial';

  Future<Page<FinancialModel>> findAll({int page = 1}) async {
    int size = 10;

    final url = Uri.http(
      financialPath,
      '/all',
      {'page': '$page', 'size': '$size'},
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return Page.fromJson(
        responseJson,
        (data) => FinancialModel.fromJson(data),
      );
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<FinancialModel> findById(int id) async {
    final url = Uri.http(financialPath, '/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return FinancialModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<FinancialModel> create(FinancialModel financialModel) async {
    final url = Uri.http(financialPath);
    final response = await http.post(
      url,
      body: jsonEncode(financialModel.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return FinancialModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<FinancialModel> update(FinancialModel financialModel) async {
    final url = Uri.http(financialPath);
    final response = await http.put(
      url,
      body: jsonEncode(financialModel.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      return FinancialModel.fromJson(responseJson);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }

  Future<void> delete(int id) async {
    final url = Uri.http(financialPath, '/$id');
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Error response: ${errorResponse['message']}');
    }
  }
}
