import 'package:flutter/material.dart';

class Componentes {
  criaAppBar(texto, acao) {
    return AppBar(
      backgroundColor: const Color(0xFF1B281F),
      title: const Text('CONSULATO LIVRARIA'),
      centerTitle: true,
      titleTextStyle: const TextStyle(
          letterSpacing: 2, color: Color(0xFFD8DACC), fontSize: 25),
      actions: <Widget>[
        Image.asset('/imgs/consulato2.jpg'),
        IconButton(
            color: const Color(0xFFD8DACC),
            onPressed: acao,
            icon: const Icon(Icons.home))
      ],
    );
  }

  criaTexto(texto, [cor]) {
    if (cor != null) {
      return Text(
        texto,
        style: const TextStyle(color: Color(0xFFD8DACC)),
      );
    }
    return Text(texto);
  }

  criaInputTexto(tipoTeclado, textoEtiqueta, controlador) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: tipoTeclado,
        cursorColor: const Color(0xFF1B281F),
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 15),
        controller: controlador,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 33, 39, 33))),
          labelText: textoEtiqueta,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 33, 39, 33),
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  criaBotao(controladorFormulario, funcao, titulo) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            height: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xFF1B281F)),
              onPressed: () {
                if (controladorFormulario.currentState!.validate()) {
                  funcao();
                }
              },
              child: Text(
                titulo,
                style: const TextStyle(
                  color: Color(0xFFD8DACC),
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
