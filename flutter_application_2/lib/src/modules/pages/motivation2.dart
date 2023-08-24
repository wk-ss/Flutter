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
        title: Text("Minha Princesa"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/data/imagns/Imagem3.jpg'), // Altere o caminho da imagem
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Você entrou na minha vida como nos contos da Disney e naquele instante decidi que passaria o resto da vida contigo. Eu posso não ser um autor de contos de fadas, mas, se permitires, posso te proporcionar uma vida de princesa.",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 100, 4, 67),
                ),
                textAlign: TextAlign.center, // Alinha o texto ao centro
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showFullScreenImage(
                      context); // Chama a função para exibir a imagem em tela cheia
                },
                child: Text("Clique Aqui"),
              ),
            ],
          ),
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
                image: AssetImage('assets/data/imagns/Imagem3.1.jpg'),
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
