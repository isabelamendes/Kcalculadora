import 'package:flutter/material.dart';

class Login {
  String username = "";
  String password = "";

  doSomething() {
    print("Username: $username");
    print("Password: $password");
    print("");
  }
}

class MyFirstFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final Login loginData = new Login();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(50.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (String inValue) {
                      if (inValue.length == 0) {
                        //return "Please enter username";
                      }
                      return null;
                    },
                    onSaved: (String inValue) {
                      loginData.username = inValue;
                    }
                ),
                TextFormField(
                  obscureText: true,
                  validator: (String inValue) {
                    if (inValue.length < 10) {
                      return "Password precisa ser maior do que 10 characteres";
                    }
                    return null;
                  },
                  onSaved: (String inValue) {
                    loginData.password = inValue;
                  },
                ),
                RaisedButton(
                    child: Text("Log In!"),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        loginData.doSomething();
                      }
                    }
                )
              ],
            )
        )
    );
  }
}