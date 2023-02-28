import 'package:flutter/material.dart';
import 'package:http_practice_app/models/user_model.dart';
import 'package:http_practice_app/widgets/app_button.dart';
import 'package:http_practice_app/widgets/detail_box.dart';

class UserProfileEditPage extends StatelessWidget {
  const UserProfileEditPage({super.key});

  static const routeName = '/userProfileedit';
  @override
  Widget build(BuildContext context) {
        final userDetails = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),





              AppButton(
                label: 'Save',
                function: () {},
                hight: 50,
                width: 130,
              ),
              const SizedBox(height: 10),
              AppButton(
                label: 'Cancel',
                function: () {},
                hight: 50,
                width: 130,
              ),
            ],
          )),
    );
  }
}
