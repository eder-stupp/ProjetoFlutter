import 'package:cidade/api/acesso_api.dart';
import 'package:cidade/model/cidade.dart';
import 'package:cidade/util/componentes.dart';
import 'package:cidade/util/estado.dart';
import 'package:flutter/material.dart';

class ConsultaCidadeEstado extends StatefulWidget {
  const ConsultaCidadeEstado({super.key});

  @override
  State<ConsultaCidadeEstado> createState() => _ConsultaCidadeEstadoState();
}

class _ConsultaCidadeEstadoState extends State<ConsultaCidadeEstado> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtUf = TextEditingController();
  List<Cidade> lista = [];

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  listarCidadeEstado() async {
    List<Cidade> cidades = await AcessoApi().listaCidadeEstado(txtUf.text);
    setState(() {
      lista = cidades;
    });
  }

  @override
  Widget build(BuildContext context) {
    criaItemCidade(Cidade c, context) {
      return ListTile(
        title: Text('${c.id} - ${c.nome}/${c.uf}'),
        textColor: const Color(0xFF1B281F),
        leading: const Icon(Icons.location_on),
        iconColor: const Color(0xFF1B281F),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      "/cadastroCidades",
                      arguments: c,
                    );
                  }),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluiCidade(c.id);
                    setState(() {
                      listarCidadeEstado();
                    });
                  }),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        appBar: Componentes().criaAppBar("CONSULATO LIVRARIA", home),
        body: Form(
            key: formController,
            child: Column(children: [
              Center(child: Estado(controller: txtUf)),
              Componentes()
                  .criaBotao(formController, listarCidadeEstado, 'Listar'),
              const Divider(
                indent: 10,
                endIndent: 10,
                color: Color(0xFF1B281F),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Expanded(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) {
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      child: criaItemCidade(lista[indice], context),
                    );
                  },
                ),
              )
            ])));
  }
}
