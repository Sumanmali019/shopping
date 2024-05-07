import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopping/screens/auth/services/auth_service.dart';

import '../../../common/widget/Custom_button.dart';
import '../../../common/widget/custom_textFiled.dart';
import '../../../constant/globle_variable.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthSerice authSerice = AuthSerice();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontoller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _namecontroller.dispose();
    _passwordcontoller.dispose();
  }

  void signupUser() {
    authSerice.signUpUser(
      context: context,
      name: _namecontroller.text,
      password: _passwordcontoller.text,
      email: _emailController.text,
    );
  }

  void signInUser() {
    authSerice.signInUser(
      context: context,
      password: _passwordcontoller.text,
      email: _emailController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signUp
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signUp,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signUp)
              Container(
                padding: const EdgeInsets.all(12),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomtextField(
                        text: " Name",
                        controller: _namecontroller,
                      ),
                      const Gap(10),
                      CustomtextField(
                        text: " Email",
                        controller: _emailController,
                      ),
                      const Gap(10),
                      CustomtextField(
                        text: " Password",
                        controller: _passwordcontoller,
                      ),
                      const Gap(10),
                      CustomButton(
                        onTab: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signupUser();
                          }
                        },
                        text: "Sign up",
                      )
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signIn
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign-In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signIn,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signIn)
              Container(
                padding: const EdgeInsets.all(12),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      const Gap(10),
                      CustomtextField(
                        text: " Email",
                        controller: _emailController,
                      ),
                      const Gap(10),
                      CustomtextField(
                        text: " Password",
                        controller: _passwordcontoller,
                      ),
                      const Gap(10),
                      CustomButton(
                        onTab: () {
                          if (_signInFormKey.currentState!.validate()) {
                            signInUser();
                          }
                        },
                        text: "Sign in",
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
