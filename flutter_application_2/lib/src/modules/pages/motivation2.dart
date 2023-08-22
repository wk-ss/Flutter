import 'package:flutter/material.dart';

class Motivation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota (tela)"),
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
