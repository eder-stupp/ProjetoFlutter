import 'package:cidade/api/acesso_api.dart';
import 'package:cidade/model/cidade.dart';
import 'package:cidade/model/cliente.dart';
import 'package:cidade/util/combo_cidade.dart';
import 'package:cidade/util/componentes.dart';
import 'package:flutter/material.dart';

class ConsultaClienteCidade extends StatefulWidget {
  const ConsultaClienteCidade({super.key});

  @override
  State<ConsultaClienteCidade> createState() => _ConsultaClienteCidadeState();
}

class _ConsultaClienteCidadeState extends State<ConsultaClienteCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtCidade = TextEditingController();
  List<Cliente> lista = [];

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  listarClienteCidade() async {
    List<Cliente> clientes =
        await AcessoApi().listaClienteCidade(int.parse(txtCidade.text));
    setState(() {
      lista = clientes;
    });
  }

  @override
  Widget build(BuildContext context) {
    criaItemCliente(Cliente p, context) {
      return ListTile(
        title: Text('${p.id} - ${p.nome} - ${p.idade} anos'),
        subtitle: Text('Sexo: ${p.sexo} - ${p.cidade.nome}/${p.cidade.uf}'),
        textColor: const Color(0xFF1B281F),
        leading: const Icon(Icons.person),
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
                      "/cadastroCliente",
                      arguments: p,
                    );
                  }),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluiCliente(p.id);
                    setState(() {
                      listarClienteCidade();
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
              Center(child: ComboCidade(controller: txtCidade)),
              Componentes()
                  .criaBotao(formController, listarClienteCidade, 'Listar'),
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
                      child: criaItemCliente(lista[indice], context),
                    );
                  },
                ),
              )
            ])));
  }
}
