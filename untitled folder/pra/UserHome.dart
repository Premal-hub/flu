import 'package:api_1/UserModel.dart';
import 'package:flutter/material.dart';
import 'UserServices.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  late Future<List<UserModel>> futureUsers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUsers = UserServices().fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("USER"), centerTitle: true),
      body: FutureBuilder<List<UserModel>>(
        future: futureUsers,
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapShot.hasError) {
            return Center(child: Text("ERROR: ${snapShot.error}"));
          }

          final users = snapShot.data ?? [];
          // final users = snapShot.data

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Row(
                children: [
                  CircleAvatar(child: Text(user.id.toString() ?? "")),
                  Card(
                    child: Text("EMAIL : ${user.email.toString()}"),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
