import 'package:cidade/util/componentes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastro() {
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }

    consulta() {
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('CONSULATO LIVRARIA', home),
      body: Form(
        key: formController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 200,
                width: 200,
                child: Image.asset("imgs/consulato.jpg"),
                padding: const EdgeInsets.only(bottom: 50)),
            Componentes().criaBotao(formController, cadastro, 'Cadastro'),
            Componentes().criaBotao(formController, consulta, 'Consulta'),
          ],
        ),
      ),
    );
  }
}
