import 'package:flutter/material.dart';
import 'package:http_practice_app/provider/ablum_provider.dart';
import 'package:http_practice_app/provider/todo_provider.dart';
import 'package:http_practice_app/provider/user_provider.dart';
import 'package:http_practice_app/screens/Users/single_user_profile.dart';
import 'package:http_practice_app/screens/Users/user_edit_page.dart';
import 'package:http_practice_app/screens/Users/users_screen.dart';
import 'package:http_practice_app/screens/welcome_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UsersProvider()),
    ChangeNotifierProvider(create: (context) => AblumProvider()),
    ChangeNotifierProvider(create: (context) => TodoProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      routes: {
        UserDisplay.routeName: (context) => const UserDisplay(),
        UserProfile.routeName: (context) => const UserProfile(),
        UserProfileEditPage.routeName: (context) => const UserProfileEditPage(),
      },
    );
  }
}
