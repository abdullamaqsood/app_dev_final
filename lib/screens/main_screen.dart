import 'package:flutter/material.dart';
import 'home_screen_content.dart';
import 'cards_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomeScreenContent(),
          CardsScreen(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: "Cards"),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Pix"),
          BottomNavigationBarItem(icon: Icon(Icons.notes), label: "Notes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Extract"),
        ],
      ),
    );
  }
}
