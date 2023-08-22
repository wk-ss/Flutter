import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_2/src/modules/pages/motivation2.dart'; // Importe o pacote de áudio

class Motivation extends StatefulWidget {
  @override
  _MotivationState createState() => _MotivationState();
}

class _MotivationState extends State<Motivation> {
  AudioCache _audioCache = AudioCache();
  late final AudioPlayer _audioPlayer; // Crie uma instância de AudioCache
  bool _showButton1 = true;
  bool _showButton2 = true;
  bool _showButton3 = true;
  bool _showButton4 = true;
  bool _showImageAfterDelay = false;
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
        title: Text('Aperte as imagens'),
      ),
      body: Container(
        decoration: BoxDecoration(
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
              SizedBox(height: 16),
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
              SizedBox(height: 16),
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
              SizedBox(height: 16),
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
          break;
        case 2:
          _showButton2 = false;
          break;
        case 3:
          _showButton3 = false;
          break;
        case 4:
          _showButton4 = false;
          break;
      }
    });
    _startImageDisplayTimer();
  }

  void _startImageDisplayTimer() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        _showImageAfterDelay = true;
      });
      _audioPlayer.pause(); //pause a música após o atraso
      _startNewImage();
    });
  }

  void _startNewImage() {
    Timer(Duration(seconds: 4), () {
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
          SizedBox(width: 58),
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
        SizedBox(height: 16),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
