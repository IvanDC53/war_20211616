import 'package:flutter/material.dart';

class AcercaDePage extends StatelessWidget {
  const AcercaDePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('src/ivan.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Nombre: Ivan Francisco',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Apellido: Del Castillo Gomez',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Matrícula: 2021-1616',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Reflexión: La guerra es una tragedia que nunca debemos olvidar',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
