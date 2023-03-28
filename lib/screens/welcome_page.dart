import 'package:flutter/material.dart';
import 'package:http_practice_app/helpers/text_styles.dart';
import 'package:http_practice_app/provider/ablum_provider.dart';
import 'package:http_practice_app/provider/todo_provider.dart';
import 'package:http_practice_app/provider/user_provider.dart';
import 'package:http_practice_app/screens/Users/users_screen.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static const routeName = '/';
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UsersProvider>(context, listen: false).users;
      Provider.of<TodoProvider>(context, listen: false).fetchTodoList;
      Provider.of<AblumProvider>(context, listen: false).fetchAblums;
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purple, Colors.purpleAccent],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hello welcome to Test App',
                        textAlign: TextAlign.center, style: AppTextStyles.big),
                    const SizedBox(height: 15),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, UserDisplay.routeName);
                      },
                      color: Colors.blueAccent,
                      minWidth: 300,
                      child: const Text('Go to User List'),
                    ),
                  ]),
            ),
          )),
    );
  }
}
