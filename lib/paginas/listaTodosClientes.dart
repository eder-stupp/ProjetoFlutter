import 'package:cidade/api/acesso_api.dart';
import 'package:cidade/model/cliente.dart';
import 'package:cidade/util/componentes.dart';
import 'package:flutter/material.dart';

class ListaTodosClientes extends StatefulWidget {
  const ListaTodosClientes({super.key});

  @override
  State<ListaTodosClientes> createState() => _ListaTodosClientesState();
}

class _ListaTodosClientesState extends State<ListaTodosClientes> {
  List<Cliente> lista = [];

  home() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  listaTodosClientes() async {
    List<Cliente> clientes = await AcessoApi().listaCliente();
    setState(() {
      lista = clientes;
    });
  }

  @override
  void initState() {
    super.initState();
    listaTodosClientes();
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
                      listaTodosClientes();
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
            elevation: 6,
            margin: const EdgeInsets.all(3),
            child: criaItemCliente(lista[indice], context),
          );
        },
      ),
    );
  }
}
