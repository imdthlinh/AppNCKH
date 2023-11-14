import 'dart:convert';
import 'package:my_flutter_project/components/fetchJson.dart';
import 'package:my_flutter_project/services/validation.dart';

import 'package:http/http.dart';

var saveBody;

void signup(String email, String username, String password) async {
  try {
    Response response = await post(
        Uri.parse('http://192.168.56.1:9000/auth/register'),
        body: {'email': email, 'username': username, 'password': password});

    if (response.statusCode == 201) {
      isSuccessSignup = true;
      print('Success');
    } else {
      isSuccessSignup = false;
      print('Failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
//login lay token
void login(String username, String password) async {
  try {
    Response response = await post(Uri.parse('http://192.168.56.1:9000/auth'),
        body: {'username': username, 'password': password});
    print(response.statusCode);
    if (response.statusCode == 200) {
      isSuccessLogin = true;
      // final token = tokenFromJson(response.body.toString());
      // print(token);
      saveBody = json.decode(response.body);
      final token = tokenFromJson(saveBody.toString());
    } else {
      isSuccessLogin = false;
    }
  } catch (e) {
    print(e.toString());
  }
}

