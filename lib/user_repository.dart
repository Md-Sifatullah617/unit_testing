import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unit_testing/user_model.dart';

class UserRepository {
  final http.Client client;
  UserRepository(this.client);

  Future<User> getUser() async {
    final response =
        await client.get(Uri.parse("https://jsonplaceholder.org/users/1"));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("some error occured");
  }
}
