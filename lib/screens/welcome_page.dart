import 'package:flutter/material.dart';
import 'package:http_practice_app/helpers/connectivity.dart';
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

  bool _isloading = false;

  Future<bool> dataCheck() async {
    _isloading = true;
    bool a = await NetworkConnectivity.checkStatus();
    _isloading = false;
    return a;
  }

  @override
  Widget build(BuildContext context) {
    void nextPage() {
      Navigator.pushNamed(context, UserDisplay.routeName);
    }
    void show() {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 150,
            width: 150,
            child: const Text(
                'Please Ensure you are connected\nto the internet',
                style: TextStyle(fontSize: 20)),
          ),
        ),
      );
    }

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
          body: _isloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Hello welcome to Test App',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.big),
                          const SizedBox(height: 15),
                          MaterialButton(
                            onPressed: () async {
                              if (await dataCheck()) {
                                nextPage();
                              } else {
                                show();
                              }
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
