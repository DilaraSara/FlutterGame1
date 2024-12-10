import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '😿', // Üzgün kedi emojisini ekleyelim
              style: TextStyle(fontSize: 80),
            ),
            SizedBox(height: 20),
            Text(
              'Game Over',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Yeni Oyun butonuna tıklandığında yapılacak işlemler
              },
              child: Text(
                'Yeni Oyun',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
