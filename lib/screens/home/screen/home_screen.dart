import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:shopping/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(
        child: Text(user.email.toString()),
      ),
    );
  }
}
