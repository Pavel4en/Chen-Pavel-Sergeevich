import 'dart:math';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color _backgroundColor = Colors.grey.shade200;

  int _selectedIndex = 0;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''.tr()),
        leading: IconButton(
          icon: Icon(context.locale == const Locale('en', 'US') ? Icons.flag : Icons.flag_outlined),
          onPressed: () {
            setState(() {
              if (context.locale == const Locale('en', 'US')) {
                context.setLocale(const Locale('ru', 'RU'));
              } else {
                context.setLocale(const Locale('en', 'US'));
              }
            });
          },
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                        Text('#Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Text('#Age', style: TextStyle(fontSize: 18)),
                        Text('#City', style: TextStyle(fontSize: 18)),
                        Text('#Friends', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeBackgroundColor,
                child: Text('change_background'.tr()),
              ),
              const SizedBox(height: 40),
              Text('photo_gallery'.tr(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Image.asset('assets/images/photo${index + 1}.jpeg', fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'profile'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: 'friends'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'settings'.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
