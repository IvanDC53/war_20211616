import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:war_20211616/vivencia.dart';
import 'audio_recorder.dart'; // Import the AudioRecorder class

class NuevaVivienciaPage extends StatefulWidget {
  const NuevaVivienciaPage({Key? key}) : super(key: key);

  @override
  State<NuevaVivienciaPage> createState() => _NuevaVivienciaPageState();
}

class _NuevaVivienciaPageState extends State<NuevaVivienciaPage> {
  final _formKey = GlobalKey<FormState>();

  String _titulo = '';
  String _descripcion = '';
  File? _foto;
  File? _audio;

  Future<void> _tomarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _foto = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<void> _grabarAudio() async {
    final recorder = AudioRecorder(); // Create an instance of AudioRecorder
    await recorder.start();
    await Future.delayed(const Duration(seconds: 5));
    final audioFile = await recorder.stop();
    setState(() {
      _audio = audioFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva vivencia'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
              onChanged: (value) {
                setState(() {
                  _titulo = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Descripción',
              ),
              onChanged: (value) {
                setState(() {
                  _descripcion = value;
                });
              },
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _tomarFoto,
                  child: const Text('Tomar foto'),
                ),
                SizedBox(width: 10),
                _foto != null ? Text(_foto!.path) : Container(),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _grabarAudio,
                  child: const Text('Grabar audio'),
                ),
                SizedBox(width: 10),
                _audio != null ? Text(_audio!.path) : Container(),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Create a new Viviencia object with the data entered by the user
                  Viviencia nuevaViviencia = Viviencia(
                    titulo: _titulo,
                    descripcion: _descripcion,
                    foto: _foto!,
                    audio: _audio!,
                  );

                  // Add the new Viviencia object to the list of vivencias in HomePage
                  Navigator.pop(context, nuevaViviencia);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}