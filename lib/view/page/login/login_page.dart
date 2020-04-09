import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final userVM = Provider.of<UserViewModel>(context);
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _accountController,
                  decoration: InputDecoration(labelText: "Account"),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () async {
                    var status = await userVM.login(
                        _accountController.text, _passwordController.text);
                    print(status);
                    if (status == true) {
                      Navigator.of(context).pushReplacementNamed("homePage");
                    }
                  },
                  child: Text("login"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}