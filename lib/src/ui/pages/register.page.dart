import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/src/core/models/user.model.dart';
import 'package:frontend_engineer_test/src/core/providers/user.provider.dart';
import 'package:frontend_engineer_test/src/core/services/login.service.dart';
import 'package:frontend_engineer_test/src/ui/pages/home.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/login.page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static final String route = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _scaffolKey = GlobalKey<ScaffoldState>();

  final _passwordFocus = FocusNode();
  final _emailFocus = FocusNode();

  bool _isloading = false;

  User _user = User();

  void _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _isloading = true;
      });
      if (!(await LoginService().register(_user))) {
        _scaffolKey.currentState.showSnackBar(SnackBar(
          content: Text('Sign Up failed, try a diferent username.'),
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
    return Scaffold(
      key: _scaffolKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          constraints: BoxConstraints.expand(),
          child: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'user',
                    errorStyle: TextStyle(color: Colors.red)),
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
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocus);
                },
                onSaved: (value) => _user.password = value,
                validator: (value) {
                  if (value.isEmpty) return 'The password must not be empty';
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'email'),
                focusNode: _emailFocus,
                onSaved: (value) => _user.password = value,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return 'The password must not be empty';
                  if (!value.contains('@')) return 'The email is invalid';
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              _isloading
                  ? Center(child: CircularProgressIndicator())
                  : FlatButton(
                      color: Colors.orange,
                      onPressed: () {
                        _submit();
                      },
                      child: Text('Sign up'),
                    ),
              FlatButton(
                child: Text('Log in'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginPage.route);
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
