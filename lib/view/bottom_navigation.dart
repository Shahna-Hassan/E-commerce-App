import 'package:flutter/material.dart';
import 'package:lumi_ecommerce/view/cart.dart';
import 'package:lumi_ecommerce/view/home_screen.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
 int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
final screens=[HomeScreen(), CartScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(items:<BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: "Home"),

        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, color: Colors.black,), label: "Cart"),


        ],
        currentIndex: _selectedIndex,
          onTap: _onItemTapped,
           selectedLabelStyle: TextStyle(color: Colors.black), // Selected label color
  unselectedLabelStyle: TextStyle(color: Colors.grey)
        
        
        ),
    );
  }
}