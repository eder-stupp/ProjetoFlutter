import 'package:cidade/model/cidade.dart';
import 'package:cidade/model/cliente.dart';
import 'package:cidade/util/componentes.dart';
import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {
  const Consulta({super.key});

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodosClientes() {
      Navigator.of(context).pushReplacementNamed('/listaTodosClientes');
    }

    consultarClienteCidade() {
      Navigator.of(context).pushReplacementNamed('/consultaClienteCidade',
          arguments: Cliente(0, '', 'M', 0, Cidade(0, '', '')));
    }

    listarTodasCidades() {
      Navigator.of(context).pushReplacementNamed('/listaTodasCidades');
    }

    consultaCidadeEstado() {
      Navigator.of(context).pushReplacementNamed('/consultaCidadeEstado',
          arguments: Cidade(0, '', ''));
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
                formController, listarTodosClientes, 'Listar Clientes'),
            Componentes().criaBotao(formController, consultarClienteCidade,
                'Listar Clientes Por Cidade'),
            const Padding(padding: EdgeInsets.fromLTRB(5, 10, 5, 10)),
            const Divider(
              indent: 10,
              endIndent: 10,
              color: Color(0xFF1B281F),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(5, 10, 5, 10)),
            Componentes().criaBotao(
                formController, listarTodasCidades, 'Listar Cidades'),
            Componentes().criaBotao(formController, consultaCidadeEstado,
                'Listar Cidades Por Estado'),
          ],
        ),
      ),
    );
  }
}
