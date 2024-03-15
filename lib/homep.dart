import 'dart:math';
import 'package:flutter/material.dart';

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('assets/images/chipi-chipi-chipi.gif', width: 120.0, height: 120.0),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Чен Павел', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('Возраст: 23', style: TextStyle(fontSize: 18)),
                          Text('Город: Владивосток', style: TextStyle(fontSize: 18)),
                          Text('Друзья: 85', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _changeBackgroundColor,
                  child: const Text('Сменить цвет фона'),
                ),
                const SizedBox(height: 20),
                const Text('Галерея фоток', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset('assets/images/photo${index + 1}.jpeg'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
