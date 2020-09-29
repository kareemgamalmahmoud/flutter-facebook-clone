import 'dart:convert';

import 'package:facebookclone/PODO/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<User> loginWithEmail(String email, String password) async {
    http.Response response = await http
        .get("https://jsonplaceholder.typicode.com/todos/1?email=$email");
    Map<String, dynamic> userMap = json.decode(
        "{\"id\": 123123,\"name\": \"omar\",\"friends\": [{\"id\": 11223123,\"name\": \"friend2\"}, {\"id\": 1123123,\"name\": \"friend1\"}]}");
    return User.fromJson(userMap);
  }
}
