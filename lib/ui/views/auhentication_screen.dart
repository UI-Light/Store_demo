import 'package:flutter/material.dart';
import 'package:store_demo/ui/shared/textfield.dart';
import 'package:store_demo/data/http_service.dart';
import 'package:store_demo/ui/views/products_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  HttpService httpService = HttpService();
  final storage = const FlutterSecureStorage();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/fruitbasket2.png'),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/Ellipse-1.png')
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What is your Username?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextfieldWidget(
                        hintText: 'Tony',
                        controller: usernameController,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Enter your password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextfieldWidget(
                        hintText: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          var username = usernameController.text;
                          var password = passwordController.text;

                          print('usernameController: $username');
                          print('passwordcontroller: $password');
                          var jwt = await httpService.login(username, password);
                          if (jwt != null) {
                            storage.write(key: "jwt", value: jwt);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductsScreen.fromBase64(jwt)));
                          } else {
                            displayDialog(context, "An Error Occurred",
                                "No account was found matching that username and password");
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 14,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Center(
                              child: Text(
                            'Start Ordering',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onPrimary),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
