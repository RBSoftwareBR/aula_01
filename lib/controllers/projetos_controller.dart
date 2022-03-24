import 'package:aula_01/helpers/references.dart';
import 'package:aula_01/models/produto_model.dart';
import 'package:rxdart/rxdart.dart';

class ProjetosController {
  BehaviorSubject<List<Projeto>> projetosController =
      BehaviorSubject<List<Projeto>>();
  Stream<List<Projeto>> get outProjetos => projetosController.stream;
  Sink<List<Projeto>> get inProjetos => projetosController.sink;
  List<Projeto> projetos;

  BuscarProjetos() {
    projetosRef
        .where('data_inicio',
            isGreaterThan: DateTime.now().millisecondsSinceEpoch)
        .orderBy('data_inicio', descending: true)
        .get()
        .then((resultado) {
      if (resultado.docs != null) {
        if (resultado.docs.length != 0) {
          for (var r in resultado.docs) {
            Projeto p = Projeto.fromMap(r.data());
            p.id = r.id;
            projetos.add(p);
          }
        }
      }
      inProjetos.add(projetos);
    });
  }

  exemploCadastrar() {
    CadastrarProjeto(Projeto()).then((v) {
      if (v) {
        print("CADASTRADO COM SUCESSO!");
      } else {
        print("ERRO AO EFETUAR CADASTRO");
      }
    });
  }

  CadastrarProjeto(Projeto p) {
    projetosRef.add(p.toMap()).then((v) {
      if (v.id != null) {
        return true;
      } else {
        return false;
      }
    }).catchError((err) {
      print("Erro: ${err.toString()}");
      return false;
    });
  }

  AtualizarProjeto(Projeto p) {
    projetosRef.doc(p.id).set(p.toMap()).then((v) {
      return true;
    }).catchError((err) {
      print("Erro: ${err.toString()}");
      return false;
    });
  }

  DeletarProjeto(Projeto p) {
    projetosRef.doc(p.id).delete().then((v) {
      return true;
    }).catchError((err) {
      print("Erro: ${err.toString()}");
      return false;
    });
  }
}
