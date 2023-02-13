import 'dart:convert';

import 'package:cidade/model/cidade.dart';
import 'package:cidade/model/cliente.dart';
import 'package:http/http.dart';

class AcessoApi {
  Future<List<Cliente>> listaCliente() async {
    String url = 'http://localhost:8080/cliente';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cliente> clientes =
        List<Cliente>.from(l.map((p) => Cliente.fromJson(p)));
    return clientes;
  }

  Future<List<Cliente>> listaClienteCidade(int id) async {
    String url = 'http://localhost:8080/cliente/buscacliente/$id';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cliente> clientes =
        List<Cliente>.from(l.map((p) => Cliente.fromJson(p)));
    return clientes;
  }

  Future<void> insereCliente(Map<String, dynamic> cliente) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: jsonEncode(cliente));
  }

  Future<void> alteraCliente(Map<String, dynamic> cliente) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await put(Uri.parse(url), headers: headers, body: jsonEncode(cliente));
  }

  Future<void> excluiCliente(int id) async {
    String url = "http://localhost:8080/cliente/$id";
    await delete(Uri.parse(url));
  }

  Future<List<Cidade>> listaCidade() async {
    String url = 'http://localhost:8080/cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<List<Cidade>> listaCidadeEstado(String uf) async {
    String url = 'http://localhost:8080/cidade/buscauf/$uf';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<void> excluiCidade(int id) async {
    String url = "http://localhost:8080/cidade/$id";
    await delete(Uri.parse(url));
  }

  Future<void> insereCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cidade';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: jsonEncode(cidade));
  }

  Future<void> alteraCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cidade';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await put(Uri.parse(url), headers: headers, body: jsonEncode(cidade));
  }
}
