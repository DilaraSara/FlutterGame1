import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HaritaEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      body: Center(
        child: RiveAnimation.asset('assets/karakter_deneme.riv', // Rive dosyasının yolu
          fit: BoxFit.cover, // Rive animasyonunu kutuya tam sığdırmak için
          animations: ['idle'], // Oynatılacak animasyon adı
        ),
      ),
    ));
  }
}
