import 'package:cidade/api/acesso_api.dart';
import 'package:cidade/model/cidade.dart';
import 'package:cidade/model/cliente.dart';
import 'package:cidade/util/combo_cidade.dart';
import 'package:cidade/util/componentes.dart';
import 'package:cidade/util/radio_sexo.dart';
import 'package:flutter/material.dart';

class CadastroCliente extends StatefulWidget {
  const CadastroCliente({Key? key}) : super(key: key);

  @override
  State<CadastroCliente> createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: 'M');
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cliente;
    txtNome.text = args.nome;
    txtSexo.text = args.sexo;
    txtIdade.text = args.idade.toString();
    if (int.parse(txtIdade.text) == 0) {
      txtIdade.text = '';
    }
    txtCidade.text = args.cidade.toString();

    cadastrar() async {
      Cliente p = Cliente(args.id, txtNome.text, txtSexo.text,
          int.parse(txtIdade.text), Cidade(int.parse(txtCidade.text), "", ""));
      if (p.id == 0) {
        await AcessoApi().insereCliente(p.toJson());
      } else {
        await AcessoApi().alteraCliente(p.toJson());
      }
      Navigator.of(context).pushNamed('/listaTodosClientes');
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
            Componentes().criaInputTexto(TextInputType.text, 'Nome', txtNome),
            Componentes().criaInputTexto(TextInputType.text, 'Idade', txtIdade),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Center(child: RadioSexo(controller: txtSexo)),
            Center(child: ComboCidade(controller: txtCidade)),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Componentes().criaBotao(formController, cadastrar, 'Salvar'),
          ],
        ),
      ),
    );
  }
}
