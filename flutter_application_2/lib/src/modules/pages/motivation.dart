import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_2/src/modules/pages/motivation2.dart'; // Importe o pacote de áudio

class Motivation extends StatefulWidget {
  const Motivation({super.key});

  @override
  MotivationState createState() => MotivationState();
}

class MotivationState extends State<Motivation> {
  late final AudioPlayer _audioPlayer; // Crie uma instância de AudioCache
  bool _showButton1 = true;
  bool _showButton2 = true;
  bool _showButton3 = true;
  bool _showButton4 = true;
  bool _showImageAfterDelay = false;
  int cont = 0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Inicializa a instância de AudioPlayer
    _playMusic(); // Toca a música quando a tela é iniciada
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Libera recursos quando a tela for descartada
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aperte as imagens'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/data/imagns/ImagemDeFundo1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _showButton1
                  ? _buildTextButtonWithImage(
                      'Maria',
                      'assets/data/imagns/Imagem1.1.jpg',
                      () {
                        _onButtonPressed(1);
                      },
                    )
                  : _showImageAfterDelay
                      ? _buildStaticImageAndText(
                          'assets/data/imagns/Imagem2.1.jpg', 'Quer')
                      : Container(),
              const SizedBox(height: 36),
              _showButton2
                  ? _buildTextButtonWithImage(
                      'Leticia',
                      'assets/data/imagns/Imagem1.3.jpg',
                      () {
                        _onButtonPressed(2);
                      },
                    )
                  : _showImageAfterDelay
                      ? _buildStaticImageAndText(
                          'assets/data/imagns/Imagem2.2.jpg', 'Ser')
                      : Container(),
              const SizedBox(height: 16),
              _showButton3
                  ? _buildTextButtonWithImage(
                      'Ramos',
                      'assets/data/imagns/Imagem1.2.jpg',
                      () {
                        _onButtonPressed(3);
                      },
                    )
                  : _showImageAfterDelay
                      ? _buildStaticImageAndText(
                          'assets/data/imagns/Imagem2.3.jpg', 'Minha')
                      : Container(),
              const SizedBox(height: 16),
              _showButton4
                  ? _buildTextButtonWithImage(
                      'Lemos',
                      'assets/data/imagns/Imagem1.4.jpg',
                      () {
                        _onButtonPressed(4);
                      },
                    )
                  : _showImageAfterDelay
                      ? _buildStaticImageAndText(
                          'assets/data/imagns/Imagem2.4.jpg', 'Namorada ?')
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _playMusic() async {
    await _audioPlayer.play(AssetSource(
        'data/music/LookAfterYou.mp3')); // Substitua pelo caminho da sua música
  }

  void _onButtonPressed(int buttonIndex) {
    setState(() {
      switch (buttonIndex) {
        case 1:
          _showButton1 = false;
          cont++;
          break;
        case 2:
          _showButton2 = false;
          cont++;
          break;
        case 3:
          _showButton3 = false;
          cont++;
          break;
        case 4:
          _showButton4 = false;
          cont++;
          break;
      }
    });
    if (cont == 4) {
      _startImageDisplayTimer();
    }
  }

  void _startImageDisplayTimer() {
    Timer(const Duration(seconds: 6), () {
      setState(() {
        _showImageAfterDelay = true;
      });

      _startNewImage();
    });
  }

  void _startNewImage() {
    Timer(const Duration(seconds: 6), () {
      _audioPlayer.pause(); //pause a música após o atraso

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Motivation2()));
    });
  }

  Widget _buildTextButtonWithImage(
      String buttonText, String imagePath, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 164,
            height: 114,
          ),
          const SizedBox(width: 58),
          Text(buttonText,
              style: TextStyle(fontSize: 28)), // Aumenta o tamanho da fonte ,),
        ],
      ),
    );
  }

  Widget _buildStaticImageAndText(String imagePath, String text) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 154,
          height: 94,
        ),
        const SizedBox(height: 30),
        Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 100, 4, 67),
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
