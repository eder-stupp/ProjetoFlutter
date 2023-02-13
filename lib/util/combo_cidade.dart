import 'package:cidade/api/acesso_api.dart';
import 'package:cidade/model/cidade.dart';
import 'package:cidade/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ComboCidade extends StatefulWidget {
  TextEditingController? controller;
  ComboCidade({Key? key, this.controller});

  @override
  State<ComboCidade> createState() => _ComboCidadeState();
}

class _ComboCidadeState extends State<ComboCidade> {
  int? cidadesel;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cliente;
    if (args.cidade.id == 0) {
      cidadesel;
    } else {
      cidadesel = args.cidade.id;
    }

    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1))
          .then((value) => AcessoApi().listaCidade()),
      builder: ((context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<Cidade> cidades = snapshot.data;
          return Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 350,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF1B281F))),
                      label: const Text('Cidade'),
                      labelStyle: const TextStyle(
                        color: Color(0xFF1B281F),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xFF1B281F)))),
                  isExpanded: true,
                  value: cidadesel,
                  focusColor: const Color(0xFFD8DACC),
                  icon: const Icon(Icons.arrow_drop_down),
                  hint: const Text('Selecione uma cidade...'),
                  elevation: 16,
                  onChanged: (int? value) {
                    setState(() {
                      cidadesel = value;
                      widget.controller?.text = '$value';
                    });
                  },
                  items: cidades.map<DropdownMenuItem<int>>((Cidade cid) {
                    return DropdownMenuItem<int>(
                        value: cid.id,
                        child: Text(
                          '${cid.nome}/${cid.uf}',
                        ));
                  }).toList(),
                ),
              ));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(padding: EdgeInsets.only(top: 20)),
              CircularProgressIndicator(color: Color(0xFF1B281F)),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('Carregando Cidades'),
            ],
          );
        }
      }),
    );
  }
}
