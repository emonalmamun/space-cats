import 'package:http/http.dart' as http;

import '../../../utils/app_base_url.dart';

class SignupService{
  static Future<http.Response> signupSvc(
      String name,
      String email,
      String countryCode,
      String phone,
      String gender,
      String dob,
      String divisionId,
      String districtId,
      String address,
      String password,
      String macAddress,
      String profilePhoto
      ) async{
    var response = await http.post( Uri.parse("${AppBaseUrl.apiBaseUrl}/api/user/signup"),
      body: {
        'name' : phone,
        'email' : email,
        'country_code' : countryCode,
        'phone' : phone,
        'gender' : gender,
        'dob' : dob,
        'division_id' : divisionId,
        'district_id' : districtId,
        'address' : address,
        'password' : password,
        'mac_address' : macAddress,
        'profile_photo' : profilePhoto
      },
    );
    print(response.body.toString());
    print(response.statusCode.toString());
    return response;
  }
}