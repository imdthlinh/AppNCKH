// To parse this JSON data, do
//
// final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  String username;
  String password;
  String email;

  Token({
    required this.username,
    required this.password,
    required this.email,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        username: json["username"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
      };
}
