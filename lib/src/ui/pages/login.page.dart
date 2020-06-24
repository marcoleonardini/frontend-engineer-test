import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/src/core/models/user.model.dart';
import 'package:frontend_engineer_test/src/core/providers/user.provider.dart';
import 'package:frontend_engineer_test/src/core/services/login.service.dart';
import 'package:frontend_engineer_test/src/ui/pages/home.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/register.page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static final String route = '/';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _scaffolKey = GlobalKey<ScaffoldState>();

  final _passwordFocus = FocusNode();

  bool _isloading = false;

  User _user = User();

  void _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _isloading = true;
      });
      if (!(await LoginService().login(_user))) {
        _scaffolKey.currentState.showSnackBar(SnackBar(
          content: Text('Authentication failed, try again.'),
        ));
        setState(() {
          _isloading = false;
        });
      } else {
        Provider.of<UserProvider>(context, listen: false).setUser(_user);
        Navigator.pushReplacementNamed(context, HomePage.route);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffolKey,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          constraints: BoxConstraints.expand(),
          child: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'user',
                    errorStyle: TextStyle(color: Colors.redAccent)),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
                onSaved: (value) => _user.username = value,
                validator: (value) {
                  if (value.isEmpty) return 'The user must not be empty';
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                focusNode: _passwordFocus,
                obscureText: true,
                onSaved: (value) => _user.password = value,
                validator: (value) {
                  if (value.isEmpty) return 'The password must not be empty';
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              _isloading
                  ? Center(child: CircularProgressIndicator())
                  : FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        _submit();
                      },
                      child: Text('Log In'),
                    ),
              FlatButton(
                child: Text('Sign up'),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.route);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordFocus.dispose();

    super.dispose();
  }
}
