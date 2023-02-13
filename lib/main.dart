import 'package:cidade/paginas/cadastro.dart';
import 'package:cidade/paginas/cadastroCidades.dart';
import 'package:cidade/paginas/cadastroCliente.dart';
import 'package:cidade/paginas/consulta.dart';
import 'package:cidade/paginas/consultaCidadeEstado.dart';
import 'package:cidade/paginas/consultaClienteCidade.dart';
import 'package:cidade/paginas/home.dart';
import 'package:cidade/paginas/listaTodasCidades.dart';
import 'package:cidade/paginas/listaTodosClientes.dart';
import 'package:cidade/util/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CidadeCliente());
}

class CidadeCliente extends StatefulWidget {
  const CidadeCliente({super.key});

  @override
  State<CidadeCliente> createState() => _CidadeClienteState();
}

class _CidadeClienteState extends State<CidadeCliente> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Tema().criaTema(),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const Home(),
          '/cadastro': (context) => const Cadastro(),
          '/cadastroCliente': (context) => const CadastroCliente(),
          '/cadastroCidades': (context) => const CadastroCidades(),
          '/consulta': (context) => const Consulta(),
          '/listaTodasCidades': (context) => const ListaTodasCidades(),
          '/listaTodosClientes': (context) => const ListaTodosClientes(),
          '/consultaCidadeEstado': (context) => const ConsultaCidadeEstado(),
          '/consultaClienteCidade': (context) => const ConsultaClienteCidade(),
        });
  }
}
