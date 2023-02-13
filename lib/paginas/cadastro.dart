import 'package:cidade/model/cidade.dart';
import 'package:cidade/model/cliente.dart';
import 'package:cidade/util/componentes.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastroCidades() {
      Navigator.pushReplacementNamed(context, '/cadastroCidades',
          arguments: Cidade(0, '', ''));
    }

    cadastroCliente() {
      Navigator.pushReplacementNamed(context, '/cadastroCliente',
          arguments: Cliente(0, '', 'M', 0, Cidade(0, '', '')));
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('CONSULATO LIVRARIA', home),
      body: Form(
        key: formController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Componentes().criaBotao(
                formController, cadastroCliente, 'Cadastrar Cliente'),
            Componentes()
                .criaBotao(formController, cadastroCidades, 'Cadastrar Cidade'),
          ],
        ),
      ),
    );
  }
}
