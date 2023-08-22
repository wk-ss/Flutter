import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Motivation2 extends StatefulWidget {
  @override
  _Motivation2State createState() => _Motivation2State();
}

class _Motivation2State extends State<Motivation2> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Inicializa a instância de AudioPlayer
    _play_Music(); // Toca a música quando a tela é iniciada
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Libera recursos quando a tela for descartada
    super.dispose();
  }

  Future<void> _play_Music() async {
    await _audioPlayer.play(AssetSource(
        'data/music/we_found_love.mp3')); // Substitua pelo caminho da sua música
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda (tela)"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showFullScreenImage(
                context); // Chama a função para exibir a imagem em tela cheia
          },
          child: Text("Exibir Imagem"),
        ),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/data/imagns/download2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
        );
      },
    );
  }
}
