import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController numberFirstConstroller = TextEditingController();
  TextEditingController numberSecondController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _inforText = "Aguardando conta...";

  void _resetFields() {
    numberFirstConstroller.text = "";
    numberSecondController.text = "";

    setState(() {
      _inforText = "Aguardando conta...";
    });
  }

  void _soma() {
    setState(() {
      double first = double.parse(numberFirstConstroller.text);
      double second = double.parse(numberSecondController.text);
      double total = first + second;
      _inforText = "Resultado da soma : ${total.toStringAsPrecision(2)}";
    });
  }

  void _subtracao() {
    setState(() {
      double first = double.parse(numberFirstConstroller.text);
      double second = double.parse(numberSecondController.text);
      double total = first - second;
      _inforText = "Resultado da subtracao : ${total.toStringAsPrecision(2)}";
    });
  }

  void _divisao() {
    setState(() {
      double first = double.parse(numberFirstConstroller.text);
      double second = double.parse(numberSecondController.text);
      double total = first / second;
      _inforText = "Resultado da divisao : ${total.toStringAsPrecision(2)}";
    });
  }

  void _multiplicacao() {
    setState(() {
      double first = double.parse(numberFirstConstroller.text);
      double second = double.parse(numberSecondController.text);
      double total = first * second;
      _inforText = "Resultado da multiplicacao : ${total.toStringAsPrecision(2)}";
    });
  }
  void _todos() {
    setState(() {
      double first = double.parse(numberFirstConstroller.text);
      double second = double.parse(numberSecondController.text);
      double soma = first + second;
      double sub = first - second;
      double div = first / second;
      double mult = first * second;
      _inforText =
          "Soma: ${soma.toStringAsPrecision(2)} // "
              "Subtração: ${sub.toStringAsPrecision(2)}\n "
              "Divisão: ${div.toStringAsPrecision(2)} // "
              "Multiplicacao: ${mult.toStringAsPrecision(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Rosa Simples"),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.pink[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Numero Um",
                    labelStyle: TextStyle(color: Colors.white)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                controller: numberFirstConstroller,
                validator: (value){
                  if (value.isEmpty){
                    return "ERROR!! INSIRA UM NUMERO!!!";}

                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Numero Dois",
                    labelStyle: TextStyle(color: Colors.white)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                controller: numberSecondController,
                validator: (value){
                  if (value.isEmpty){
                    return "ERROR!! INSIRA UM NUMERO!!!";}
                },

              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 40.0, 60.0, 0),
                child: Container(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: (){
                      if (_formKey.currentState.validate()){
                        _soma();
                      }
                    },
                    child: Text(
                      "Soma",
                      style: TextStyle(color: Colors.white, fontSize: 20.00),
                    ),
                    color: Colors.pink[200],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 8.0, 60.0, 0),
                child: Container(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: (){
                      if (_formKey.currentState.validate()){
                        _subtracao();
                      }
                    },
                    child: Text(
                      "Subtração",
                      style: TextStyle(color: Colors.white, fontSize: 20.00),
                    ),
                    color: Colors.pink[200],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 8.0, 60.0, 0),
                child: Container(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: (){
                      if (_formKey.currentState.validate()){
                        _divisao();
                      }
                    },
                    child: Text(
                      "Divisão",
                      style: TextStyle(color: Colors.white, fontSize: 20.00),
                    ),
                    color: Colors.pink[200],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 8.0, 60.0, 0),
                child: Container(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: (){
                      if (_formKey.currentState.validate()){
                        _divisao();
                      }
                    },
                    child: Text(
                      "Multiplicação",
                      style: TextStyle(color: Colors.white, fontSize: 20.00),
                    ),
                    color: Colors.pink[200],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 8.0, 60.0, 0),
                child: Container(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: (){
                      if (_formKey.currentState.validate()){
                        _todos();
                      }
                    },
                    child: Text(
                      "Todos",
                      style: TextStyle(color: Colors.white, fontSize: 20.00),
                    ),
                    color: Colors.pink[200],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  height: 45.0,
                  child: Text(
                    _inforText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
          )
        )

    );
  }
}
