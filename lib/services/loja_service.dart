import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/loja.dart';

class LojaService {
  static const String _baseUrl = 'https://delivery-umtc.onrender.com';

  Future<List<Loja>> getLojas() async {
    final response = await http.get(Uri.parse('$_baseUrl/api/lojas'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);

      if (body['success'] == true) {
        final List<dynamic> data = body['data'] as List<dynamic>;
        return data
            .map((json) => Loja.fromJson(json as Map<String, dynamic>))
            .toList();
      }
    }

    throw Exception('Falha ao carregar lojas');
  }
}
