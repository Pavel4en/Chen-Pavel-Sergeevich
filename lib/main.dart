import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color _backgroundColor = Colors.grey.shade200;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                children: <Widget>[
                  Icon(Icons.account_circle, size: 60.0),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Чен Павел', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Возраст: 23 года', style: TextStyle(fontSize: 18)),
                      Text('Город: Владивосток', style: TextStyle(fontSize: 18)),
                      Text('Друзья: 87', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeBackgroundColor,
                child: const Text('Сменить цвет фона'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}