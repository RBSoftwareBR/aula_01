
import 'package:aula_01/helpers/projetos_list.dart';
import 'package:aula_01/widgets/my_check_box.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  String ValorSelecionado;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Text('O x Selecionado foi \n ${ValorSelecionado == null? '':ValorSelecionado}'),
        PopupMenuButton<String>(
          onSelected: (String result) {
            setState(() {
              controller.text = result;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Working a lot harder',
              child: Text('Working a lot harder'),
            ),
            const PopupMenuItem<String>(
              value: 'Working a lot harder',
              child: Text('Being a lot smarter'),
            ),
            const PopupMenuItem<String>(
              value:'Being a self-starter',
              child: Text('Being a self-starter'),
            ),
            const PopupMenuItem<String>(
              value:'Placed in charge of trading charter',
              child: Text('Placed in charge of trading charter'),
            ),
          ],
        ),],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyCheckBox(),
          TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red, width: 2.0)),
              )),
          Center(
            child: MaterialButton(
              onPressed: () {
                CadastrarNaBase(controller.text);
              },
              color: Colors.red,
              child: Text('Botão'),
            ),
          )
        ],
      ),
    );
  }

  CadastrarNaBase(String texto) {

  }
  Soma(int a, int b) {
    return a + b;
  }
}