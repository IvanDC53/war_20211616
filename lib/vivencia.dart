import 'dart:io';

class Viviencia {
  final String titulo;
  final String descripcion;
  final File foto;
  final File audio;

  Viviencia({
    required this.titulo,
    required this.descripcion,
    required this.foto,
    required this.audio,
  });
}
extension on File {
  String get path => this.path;
}