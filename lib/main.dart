import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Data Transfer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatelessWidget {
  // Definimos un dato que queremos enviar al hijo
  final String messageForChild = "Mensaje desde el Widget Padre";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Padre'),
      ),
      body: Center(
        // Aquí estamos creando el Widget Hijo y pasándole datos
        child: ChildWidget(
          receivedMessage: messageForChild, // Envío del mensaje al hijo
        ),
      ),
    );
  }
}

// Este es el Widget Hijo que recibe datos del Widget Padre
class ChildWidget extends StatelessWidget {
  // Propiedad que recibirá el mensaje desde el padre
  final String receivedMessage;

  // Constructor del widget hijo que inicializa la propiedad
  ChildWidget({required this.receivedMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Soy el Widget Hijo',
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(
            'Mensaje recibido:',
            style: TextStyle(fontSize: 20.0, color: Colors.black54),
          ),
          SizedBox(height: 5),
          Text(
            receivedMessage, // Mostrar el mensaje recibido
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
