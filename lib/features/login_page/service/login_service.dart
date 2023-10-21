import 'package:http/http.dart' as http;

import '../../../utils/app_base_url.dart';

class LoginService{
  static Future<http.Response> loginSvc(dynamic phone, dynamic password, dynamic mac)async{
    var response = await http.post( Uri.parse("${AppBaseUrl.apiBaseUrl}/api/user/login"),
      body: {
        'phone' : phone,
        'password' : password,
        'mac_address' : mac
      },
    );
    print(response.body.toString());
    print(response.statusCode.toString());
    return response;
  }
}