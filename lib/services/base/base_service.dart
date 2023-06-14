import 'dart:convert';

import 'package:gumtree_hr_management/services/base/i_base_service.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

class BaseService<T> implements IBaseService {
  @override
  Future<T>? getAsync(String? path) async {
    try {
      final response = await http.get(Uri.https(baseUrl, path!));
      //Check if the response is 200
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.statusCode.toString());
      }
    } catch (err) {
      throw Exception();
    }
  }

  @override
  Future<T>? postAsync() {
    // TODO: implement postAsync
    throw UnimplementedError();
  }
}
