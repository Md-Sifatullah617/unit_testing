import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unit_testing/user_repository.dart';

class UserDataListScreen extends StatelessWidget {
  const UserDataListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: UserRepository(Client()).getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(child: Text("${snapshot.data!.toJson()}"));
          }),
    );
  }
}
