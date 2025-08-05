import 'package:flutter/material.dart';
import 'package:kakeibo/ui/components/viewmodels/home_view_model.dart';
import 'package:kakeibo/ui/models/screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var screenIndex = 0;
  var groupIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      Screen(
        title: 'ホーム',
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        screen: HomeViewModel(),
      ),
      Screen(
        title: 'ホーム',
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        screen: HomeViewModel(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(screens[screenIndex].title)),
      body: Center(child: screens[screenIndex].screen),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
            groupIndex = 0;
          });
        },
        selectedIndex: screenIndex,
        destinations: screens.map((Screen screen) {
          return screen.destination;
        }).toList(),
      ),
    );
  }
}
