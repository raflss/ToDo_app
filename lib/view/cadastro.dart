import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class cadastro extends StatefulWidget {
  cadastro({super.key});
  final nomeCad = TextEditingController();
  final userCad = TextEditingController();
  final senhaCad = TextEditingController();
  final conSenCad = TextEditingController();

  @override
  State<cadastro> createState() => _cadastroState();
}

class _cadastroState extends State<cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.deepPurpleAccent[700],
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 270,
          ),
          Text(
            'Vamos começar!',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: TextField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: 'Nome'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: TextField(
              controller: null,
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
              controller: null,
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
            child: TextField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: 'Confirmar senha'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 130,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple[900],
                  side: BorderSide(color: Colors.white, width: 2)),
              child: Text('Cadastrar'),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Divider(
            color: Colors.white,
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Já possui cadastro? Entrar',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ]),
      ),
    );
  }
}
