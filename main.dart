import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int brightness = 0;
  bool bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.grey[900 - brightness],
            padding: const EdgeInsets.all(30.0),
            child: Column(children: <Widget>[
              Image(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1613136425456-09493c7a2678?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                  width: 450),
              Center(
                child: Text("Ajusta el brillo de la pantalla",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.cyan[800])),
              ),
              Slider.adaptive(
                  value: brightness.toDouble(),
                  onChanged: (bloquearCheck)
                      ? null
                      : (newBrightness) {
                          setState(() => brightness = newBrightness.toInt());
                        },
                  min: 0,
                  max: 900,
                  divisions: 9,
                  label: "$brightness",
                  activeColor: Colors.cyan[700],
                  inactiveColor: Colors.cyan[900]),
              _checkBox(),
            ])));
  }

  Widget _checkBox() {
    return Container(
        color: Colors.grey[100],
        child: CheckboxListTile(
          title: Text('Bloquear brillo'),
          value: bloquearCheck,
          onChanged: (valor) {
            setState(() {
              bloquearCheck = valor;
            });
          },
        ));
  }
}
