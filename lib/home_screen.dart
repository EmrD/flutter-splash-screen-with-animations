import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<String> content = [
    "Home",
    "Settings",
    "Your Account",
  ];
  // ignore: non_constant_identifier_names
  String text_content = "Home";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              iconSize: 20,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              showUnselectedLabels: false,
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                  text_content = content[selectedIndex];
                });
              },
              currentIndex: selectedIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box), label: "Your Account"),
              ],
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            text_content,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
