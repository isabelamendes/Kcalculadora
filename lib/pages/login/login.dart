import 'package:flutter/material.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/pages/telaPrincipal/telaNavegacao.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kcalculadora/database/user_database_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kcalculadora/database/user_reference.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<MyLoginPage> {

  final auth = FirebaseAuth.instance;
  var _context;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyLogin = new GlobalKey<FormState>();
  final UserKcal user = new UserKcal();
  String emailLogin;
  String passwordLogin;
  String emailRegistro;
  String passwordRegistro;
  String passwordRegistroConfirm;
  UserKcal userRegistro = new UserKcal();

  _toTelaPrincipalView(UserKcal user) {
    setState((){
      Navigator.push(_context,
        MaterialPageRoute(
          builder: (BuildContext context) {
          return TelaNavegacao(user);
        })
      );
    });
  }

  void _loginUser(BuildContext context) async {
    final scaffold = Scaffold.of(context);
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: this.emailLogin, password: this.passwordLogin);
      String uidCredential = userCredential.user.uid;
      if(uidCredential != "") {
        try {
          UserKcal user = await new UserReference().getUserByUidCredential(uidCredential);
          _toTelaPrincipalView(user);
        } catch(e) {
          scaffold.showSnackBar(
            SnackBar(
              content: Text('Problemas ao encontrar UID do Usuário!'),
            ),
          );
        }
      }
    } catch(e) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text('Usuário não autenticado no Firebase!'),
        ),
      );
    }
  }

  void _registrarUsuario(BuildContext context, UserKcal user) async {
    final scaffold = Scaffold.of(context);
    if (this.passwordRegistro == this.passwordRegistroConfirm) {
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: this.emailRegistro, password: this.passwordRegistro);
        String uidCredential = userCredential.user.uid;
        if(uidCredential != "") {
          user.uidCredential = uidCredential;
          new UserReference().createUser(user);
        }
        scaffold.showSnackBar(
          SnackBar(
            content: Text('Usuário registrado com sucesso!'),
          ),
        );
      } catch(e) {
        scaffold.showSnackBar(
          SnackBar(
            content: Text('Problemas ao criar o usuário!'),
          ),
        );
      }
    }
    else {
      scaffold.showSnackBar(
        SnackBar(
          content: Text('As senhas não coincidem!'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget HomePage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: PRIMARY_THEME_COLOR,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.15), BlendMode.dstATop),
          image: AssetImage('assets/images/apple.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 250.0),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.calculator,
                color: Colors.white,
                size: 50.0,
              ),
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Kcalculadora",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    highlightedBorderColor: Colors.white,
                    onPressed: () => gotoSignup(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "Registrar-se",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    onPressed: () => gotoLogin(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "Entrar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: PRIMARY_THEME_COLOR,
                                  fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }

  Widget LoginPage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.07), BlendMode.dstATop
          ),
          image: AssetImage('assets/images/apple.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Form(
          key: formKeyLogin,
          child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(120.0),
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_THEME_COLOR,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: PRIMARY_THEME_COLOR,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'email@exemplo.com.br',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String inValue) {
                        if (inValue.isEmpty) {
                          return "Digite seu email";
                        }
                      },
                      onSaved: (String inValue) {
                        this.emailLogin = inValue;
                      }
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "Senha",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_THEME_COLOR,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: PRIMARY_THEME_COLOR,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '*********',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String inValue) {
                        if (inValue.isEmpty) {
                          return "Insira sua senha";
                        }
                          return null;
                      },
                      onSaved: (String inValue) {
                        this.passwordLogin = inValue;
                      }
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: new FlatButton(
                    child: new Text(
                      "Não possui uma conta?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_THEME_COLOR,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () => gotoSignup(),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: Builder(
                      builder: (context) => Center(
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          splashColor: PRIMARY_THEME_COLOR,
                          color: PRIMARY_THEME_COLOR,
                          child: new Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              new Expanded(
                                child: Container(),
                              ),
                              new Transform.translate(
                                offset: Offset(15.0, 0.0),
                                child: new Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: FlatButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(28.0)),
                                    splashColor: Colors.white,
                                    color: Colors.white,
                                    child: FaIcon(
                                      FontAwesomeIcons.signInAlt,
                                      color: PRIMARY_THEME_COLOR,
                                    ),
                                    onPressed: () {
                                      if (formKeyLogin.currentState.validate()) {
                                        formKeyLogin.currentState.save();
                                        this._loginUser(context);
                                      }
                                    }
                                  ),
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            if (formKeyLogin.currentState.validate()) {
                              formKeyLogin.currentState.save();
                              this._loginUser(context);
                            }
                          }
                        ),
                      )
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SignupPage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.07), BlendMode.dstATop),
          image: AssetImage('assets/images/apple.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(60.0),
              
            ),
            Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_THEME_COLOR,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: PRIMARY_THEME_COLOR,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'email@exemplo.com.br',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String inValue) {
                        if (inValue.isEmpty) {
                          return "Digite seu email";
                        }
                      },
                      onSaved: (String inValue) {
                        this.emailRegistro = inValue;
                      }
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "Senha",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_THEME_COLOR,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: PRIMARY_THEME_COLOR,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '*********',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String inValue) {
                        if (inValue.isEmpty) {
                          return "Digite sua senha";
                        }
                        if (inValue.length <  6) {
                          return "A senha deve conter 6 ou mais dígitos";
                        }
                        return null;
                      },
                      onSaved: (String inValue) {
                        this.passwordRegistro = inValue;
                      }
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "Confirmar Senha",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_THEME_COLOR,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: PRIMARY_THEME_COLOR,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '*********',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String inValue) {
                        if (inValue.isEmpty) {
                          return "Confirme sua senha";
                        }
                        if (inValue.length <  6) {
                          return "A senha deve conter 6 ou mais dígitos";
                        }
                          return null;
                      },
                      onSaved: (String inValue) {
                        this.passwordRegistroConfirm = inValue;
                      }
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: new FlatButton(
                    child: new Text(
                      "Já possui uma conta?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_THEME_COLOR,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () => gotoLogin()
                  ),
                ),
              ],
            ),
            new Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: Builder(
                      builder: (context) => Center(
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          splashColor: PRIMARY_THEME_COLOR,
                          color: PRIMARY_THEME_COLOR,
                          child: new Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Criar conta",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              new Expanded(
                                child: Container(),
                              ),
                              new Transform.translate(
                                offset: Offset(15.0, 0.0),
                                child: new Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: FlatButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(28.0)),
                                    splashColor: Colors.white,
                                    color: Colors.white,
                                    child: FaIcon(
                                      FontAwesomeIcons.userPlus,
                                      color: PRIMARY_THEME_COLOR,
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState.validate()) {
                                        formKey.currentState.save();
                                        _registrarUsuario(context, this.userRegistro);
                                         
                                      }
                                                                           
                                    }
                                  ),
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              _registrarUsuario(context, this.userRegistro);
                              
                            }      
                          }
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  gotoLogin() {
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  PageController _controller = new PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: PageView(
                  controller: _controller,
                  physics: new AlwaysScrollableScrollPhysics(),
                  children: <Widget>[LoginPage(), HomePage(), SignupPage()],
                  scrollDirection: Axis.horizontal,
                )
              )
            )
          ])
      )
    )
    );
  }
    
}
