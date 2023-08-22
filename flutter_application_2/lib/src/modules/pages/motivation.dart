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
            image: AssetImage('assets/data/imagns/black.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _showButton1
                  ? _buildTextButtonWithImage(
                      'Botão 1',
                      'assets/data/imagns/black.png',
                      () {
                        _onButtonPressed(1);
                      },
                    )
                  : _showImageAfterDelay
                      ? _buildStaticImageAndText(
                          'assets/data/imagns/IMG2.png', 'Texto Estático 1')
                      : Container(),
              const SizedBox(height: 16),
              _showButton2
                  ? _buildTextButtonWithImage(
                      'Botão 2',
                      'assets/data/imagns/black.png',
                      () {
                        _onButtonPressed(2);
                      },
                    )
                  : _showImageAfterDelay
                      ? _buildStaticImageAndText(
                          'assets/data/imagns/IMG2.png', 'Texto Estático 2')
                      : Container(),
              const SizedBox(height: 16),
              _showButton3
                  ? _buildTextButtonWithImage(
                      'Botão 3',
                      'assets/data/imagns/black.png',
                      () {
                        _onButtonPressed(3);
                      },
                    )
                  : _showImageAfterDelay
                      ? _buildStaticImageAndText(
                          'assets/data/imagns/IMG2.png', 'Texto Estático 3')
                      : Container(),
              const SizedBox(height: 16),
              _showButton4
                  ? _buildTextButtonWithImage(
                      'Botão 4',
                      'assets/data/imagns/black.png',
                      () {
                        _onButtonPressed(4);
                      },
                    )
                  : _showImageAfterDelay
                      ? _buildStaticImageAndText(
                          'assets/data/imagns/IMG2.png', 'Texto Estático 4')
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _playMusic() async {
    await _audioPlayer.play(AssetSource(
        'data/music/bomba.mp3')); // Substitua pelo caminho da sua música
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
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _showImageAfterDelay = true;
      });

      _startNewImage();
    });
  }

  void _startNewImage() {
    Timer(const Duration(seconds: 4), () {
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
            width: 94,
            height: 84,
          ),
          const SizedBox(width: 58),
          Text(buttonText),
        ],
      ),
    );
  }

  Widget _buildStaticImageAndText(String imagePath, String text) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 94,
          height: 84,
        ),
        const SizedBox(height: 16),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
