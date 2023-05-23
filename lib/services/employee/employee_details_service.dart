import 'dart:convert';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/employee/i_employee_details_service.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

//Implementing the IEmployeeDetailsService
class EmployeeDetailsService extends IEmployeeDetailsService {
  @override
  Future<Data>? getEmployeeDetails(String id) async {
    try {
      //Get employee details using employee's ID
      final response = await http.get(Uri.https(baseUrl, employeePath + id));
      //Check if the eresponse status code is 200
      if (response.statusCode == 200) {
        //Decode and Map the employee's details
        return Data.fromJson(jsonDecode(response.body)["data"]);
      } else {
        //Decode and return the status code
        return jsonDecode(response.statusCode.toString());
      }
    } catch (err) {
      //Throw Exception
      throw Exception();
    }
  }
}
