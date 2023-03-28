import 'package:flutter/material.dart';
import 'package:http_practice_app/models/user_model.dart';
import 'package:http_practice_app/screens/Users/user_edit_page.dart';
import 'package:http_practice_app/widgets/app_button.dart';
import 'package:http_practice_app/widgets/detail_box.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  static const routeName = '/userProfile';
  @override
  Widget build(BuildContext context) {
    final userDetails = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text(userDetails.username),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              const SizedBox(height: 30),
              Text(
                'Hello ${userDetails.name}',
                style: const TextStyle(fontSize: 21),
              ),
              const SizedBox(height: 30),
              const Text(
                  'Kindly find Your details below\nFeel free to edit or delete any data'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  DetailBox(label: 'Email', body: userDetails.email),
                  const SizedBox(height: 10),
                  DetailBox(label: 'Phone', body: userDetails.phone),
                  const SizedBox(height: 10),
                  DetailBox(label: 'WebSite', body: userDetails.website),
                  const SizedBox(height: 10),
                  DetailBox(label: 'Address', body: userDetails.address.street),
                  const SizedBox(height: 10),
                  DetailBox(label: 'Phone', body: userDetails.phone),
                ],
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: AppButton(
                  label: 'Edit',
                  function: () {
                    Navigator.pushNamed(context, UserProfileEditPage.routeName,
                        arguments: userDetails);
                  },
                  width: 120,
                  hight: 50,
                ),
              ),
            ],
          )),
    );
  }
}
