import 'dart:io';

class AudioRecorder {
  late AudioRecorderController _controller;

  Future<void> start() async {
    _controller = AudioRecorderController();
    await _controller.start();
  }

  Future<File> stop() async {
    final audioData = await _controller.stop();
    return File(audioData.path);
  }
}

class AudioRecorderController {
  Future<void> start() async {
    // Implement the logic to start recording audio
  }

  Future<AudioData> stop() async {
    // Implement the logic to stop recording audio and return the audio data
    return AudioData(path: '/path/to/audio/file');
  }
}

class AudioData {
  final String path;

  AudioData({required this.path});
}