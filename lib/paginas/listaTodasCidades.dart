import 'package:cidade/api/acesso_api.dart';
import 'package:cidade/model/cidade.dart';
import 'package:cidade/util/componentes.dart';
import 'package:flutter/material.dart';

class ListaTodasCidades extends StatefulWidget {
  const ListaTodasCidades({super.key});

  @override
  State<ListaTodasCidades> createState() => _ListaTodasCidadesState();
}

class _ListaTodasCidadesState extends State<ListaTodasCidades> {
  List<Cidade> lista = [];

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  listaTodasCidades() async {
    List<Cidade> cidades = await AcessoApi().listaCidade();
    setState(() {
      lista = cidades;
    });
  }

  @override
  void initState() {
    super.initState();
    listaTodasCidades();
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
                      listaTodasCidades();
                    });
                  }),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("CONSULATO LIVRARIA", home),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, indice) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.fromLTRB(6, 3, 6, 3),
            child: criaItemCidade(lista[indice], context),
          );
        },
      ),
    );
  }
}
