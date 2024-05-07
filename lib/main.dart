import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:shopping/constant/globle_variable.dart';
import 'package:shopping/screens/auth/screens/auth_screen.dart';
import 'package:shopping/providers/user_provider.dart';
import 'package:shopping/router.dart';
import 'package:shopping/screens/auth/services/auth_service.dart';
import 'package:shopping/screens/home/screen/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthSerice authService = AuthSerice();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomeScreen()
          : const AuthScreen(),
    );
  }
}
