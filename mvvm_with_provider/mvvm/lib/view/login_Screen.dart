import 'package:flutter/material.dart';
import 'package:mvvm/res/components/rounded_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.mail),
              ),
              onFieldSubmitted: (value) {
                Utils.moveFocus(
                  // focus that is currently
                  context: context,
                  currentNode: emailFocusNode,
                  nextNode:
                      passwordFocusNode, // focus that we want to shift(jump to next foam field)
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: ValueListenableBuilder(
              valueListenable: _obSecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: passwordFocusNode,
                  obscureText: _obSecurePassword.value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // togel obsecure
                        _obSecurePassword.value = !_obSecurePassword.value;
                      },
                      icon: _obSecurePassword.value
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height * 0.080),
          RoundedButton(
              title: "Login ",
              onPress: () {
                // foam validation
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Please enter email address", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Please enter your Password.", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      "Your password must be at least 6 characters long.",
                      context);
                } else {
                  // call login api
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authProvider.loginUser(data, context);
                  print("Login SucessFul");
                }
              })
        ],
      ),
    );
  }
}
