import 'package:cidade/api/acesso_api.dart';
import 'package:cidade/model/cidade.dart';
import 'package:cidade/util/componentes.dart';
import 'package:cidade/util/estado.dart';
import 'package:flutter/material.dart';

class CadastroCidades extends StatefulWidget {
  const CadastroCidades({Key? key}) : super(key: key);

  @override
  State<CadastroCidades> createState() => _CadastroCidadesState();
}

class _CadastroCidadesState extends State<CadastroCidades> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtUf = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cidade;
    txtCidade.text = args.nome;
    txtUf.text = args.uf;

    salvar() async {
      Cidade c = Cidade(args.id, txtCidade.text, txtUf.text);
      if (c.id == 0) {
        await AcessoApi().insereCidade(c.toJson());
      } else {
        await AcessoApi().alteraCidade(c.toJson());
      }
      Navigator.of(context).pushNamed('/listaTodasCidades');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("CONSULATO LIVRARIA", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes()
                .criaInputTexto(TextInputType.text, 'Cidade', txtCidade),
            Center(child: Estado(controller: txtUf)),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Componentes().criaBotao(formController, salvar, 'Salvar'),
          ],
        ),
      ),
    );
  }
}
