import 'package:flutter/material.dart';
import 'SoundSettingsPage.dart';

class AyarlarSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/settingScreen.jpg"), // Arka plan resminin yolunu ayarlayın
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🐱', // Kedi emojisini ekleyelim
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SoundSettingsPage()),
                  );
                },
                child: Text(
                  'Ses',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 60),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SkorTablosuSayfasi()),
                  );
                },
                child: Text(
                  'Skor Tablosu',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 60),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Yeni Oyun butonuna tıklanınca yapılacak işlemler
                },
                child: Text(
                  'Yeni Oyun',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkorTablosuSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skor Tablosu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/scoreTable.jpg"), // Arka plan resminin yolunu ayarlayın
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🐱', // Kedi emojisini ekleyelim
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 20),
              DataTable(
                columns: [
                  DataColumn(label: Text('Sıra')),
                  DataColumn(label: Text('İsim')),
                  DataColumn(label: Text('Skor')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Ahmet')),
                    DataCell(Text('100')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('Mehmet')),
                    DataCell(Text('90')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('Ayşe')),
                    DataCell(Text('80')),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
