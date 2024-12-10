import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/question.dart';
import 'HaritaEkrani.dart';
import 'SoundSettingsPage.dart';
import 'DatabaseHelper.dart';
import 'package:flutter/material.dart';

class SoruEkrani extends StatefulWidget {
  @override
  _SoruEkraniState createState() => _SoruEkraniState();
}

class _SoruEkraniState extends State<SoruEkrani> {
  Map<String, dynamic> _soru = {'soru': '', 'cevap': ''};

  void _yeniSoruGetir() async {
    Map<String, dynamic> yeniSoru = await question.getRastgeleSoru();
    setState(() {
      _soru = yeniSoru;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _soru['soru'],
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _yeniSoruGetir,
              child: Text('Rastgele Soru Getir'),
            ),
          ],
        ),
      ),
    );
  }
}
  class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/gamescreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HaritaEkrani()),
                    );
                  },
                  child: Text('Haritayı göster'),
                ),
                SizedBox(height: 20),
                SoruEkrani(), // RandomTextWidget'ı ekleyelim
              ],
            ),
          ),
        ),
      ),
    );
  }
}

