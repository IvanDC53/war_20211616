import 'dart:io';
import 'package:flutter/material.dart';
import 'package:war_20211616/detalle.dart';
import 'package:war_20211616/nueva_vivencia.dart';
import 'package:war_20211616/acerca_de.dart';
import 'package:war_20211616/vivencia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivencias Militares',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Viviencia> vivencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vivencias Militares'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('src/militar.png'),
                  ),
                  SizedBox(height: 10),
                  Text('Acerca de'),
                ],
              ),
            ),
            ListTile(
              title: const Text('Agregar nueva vivencia'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NuevaVivienciaPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AcercaDePage(),
                  ),
                );
              },
            ),

            ListTile(
              title: const Text('Borrar todo'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('¿Estás seguro?'),
                      content: const Text('Se borrarán todas las vivencias.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              vivencias.clear();
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('Borrar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: vivencias.length,
        itemBuilder: (context, index) {
          final vivencia = vivencias[index];
          return ListTile(
            title: Text(vivencia.titulo),
            subtitle: Text(vivencia.descripcion),
            leading: vivencia.foto != null ? Image.file(vivencia.foto!) : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VivienciaDetallePage(vivencia: vivencia),
                ),
              );
            },
          );
        },
      ),
    );
  }
}