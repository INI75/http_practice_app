import 'package:flutter/material.dart';
import 'package:http_practice_app/screens/Users/single_user_profile.dart';

import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class UserDisplay extends StatelessWidget {
  const UserDisplay({super.key});
  static const routeName = '/usersPage';
  @override
  Widget build(BuildContext context) {
    var usersList = Provider.of<UsersProvider>(context);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Users Page')),
      body: Container(
        width: media.width,
        height: media.height,
        padding: const EdgeInsets.all(10),
        child: Visibility(
          visible: usersList.list.isNotEmpty,
          replacement: const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          ),
          child: SizedBox(
            child: ListView.builder(
              itemCount: usersList.list.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.pushNamed(context, UserProfile.routeName,
                      arguments: usersList.list[index]);
                },
                title: Text(usersList.list[index].name),
                subtitle: Text(usersList.list[index].email),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
