import 'package:cidade/model/cidade.dart';
import 'package:flutter/material.dart';

class Estado extends StatefulWidget {
  TextEditingController? controller;
  Estado({Key? key, this.controller});

  @override
  State<Estado> createState() => _EstadoState();
}

class _EstadoState extends State<Estado> {
  List<String> estados = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];
  String? estadosel;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cidade;
    if (args.uf == '') {
      estadosel;
    } else {
      estadosel = args.uf;
    }

    return Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            width: 350,
            child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1B281F))),
                    label: const Text('Estado'),
                    labelStyle: const TextStyle(
                      color: Color(0xFF1B281F),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 3, color: Color(0xFF1B281F)))),
                value: estadosel,
                focusColor: const Color(0xFFD8DACC),
                icon: const Icon(Icons.arrow_drop_down),
                hint: const Text('Selecione um Estado...'),
                elevation: 16,
                items: estados
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e, style: const TextStyle(fontSize: 25)),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    widget.controller?.text = '$value';
                  });
                })));
  }
}
