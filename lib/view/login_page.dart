import 'package:todo_lovepeople/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_lovepeople/view/cadastro.dart';

class LoginPage extends StatefulWidget {
  static const KEY_BUTTON_LOGIN = Key('KEY_BUTTON_LOGIN');
  static const KEY_INPUT_EMAIL = Key('KEY_INPUT_EMAIL');
  static const KEY_INPUT_PASS = Key('KEY_INPUT_PASS');
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<LoginController>().verifyLogin(goHome);
    return Consumer<LoginController>(builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[700],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("lovepeople",
              style: TextStyle(color: Colors.deepPurpleAccent[700])),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200))),
          bottom: PreferredSize(
              child: SizedBox(), preferredSize: Size.fromHeight(200)),
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              'Que bom que voltou!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: TextField(
                key: LoginPage.KEY_INPUT_EMAIL,
                controller: _emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: 'Telefone, email ou CPF'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: TextField(
                key: LoginPage.KEY_INPUT_PASS,
                obscureText: true,
                controller: _senhaController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: 'Senha'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Esqueceu seu login ou senha?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 130,
              child: ElevatedButton(
                key: LoginPage.KEY_BUTTON_LOGIN,
                onPressed: () {
                  controller.login(
                    _emailController.text,
                    _senhaController.text,
                    success: goHome,
                    failure: () {
                      print('Email ou senha inválidos');
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple[900],
                    side: BorderSide(color: Colors.white, width: 2)),
                child: Text('Login'),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => cadastro()));
              },
              child: Text(
                'Não possui cadastro? Clique aqui',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]),
        ),
      );
    });
  }

  void goHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home',
      (_) => false,
    );
  }
}
