import 'package:flutter/material.dart';
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

    return Scaffold(
        appBar: AppBar(
          title: const Text('Http text App'),
        ),
        body: Container(
          width: media.width,
          height: media.height,
          color: Colors.white38,
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
            const Text('Hello welcome to Http Test App '),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, UserDisplay.routeName);
              },
              color: Colors.amber,
              minWidth: 300,
              child: const Text('Users List'),
            ),
          ]),
        ));
  }
}
