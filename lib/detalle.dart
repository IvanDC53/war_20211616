import 'dart:io';

import 'package:flutter/material.dart';
import 'package:war_20211616/vivencia.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart' show getTemporaryDirectory;

class VivienciaDetallePage extends StatelessWidget {
  const VivienciaDetallePage({Key? key, required this.vivencia})
      : super(key: key);

  final Viviencia vivencia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vivencia.titulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(vivencia.foto as File),
            Text(vivencia.descripcion),
            if (vivencia.audio != null) ...[
              // Botón para reproducir el audio
              ElevatedButton(
                onPressed: () async {
                  final dio = Dio();
                  final response = await dio.get<List<int>>(vivencia.audio as String,
                      options: Options(responseType: ResponseType.bytes));
                  final file = File('${(await getTemporaryDirectory()).path}/audio.mp3');
                  await file.writeAsBytes(response.data!);

                  await AudioPlayer().play(file.path as Source);
                },
                child: const Text('Reproducir audio'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
