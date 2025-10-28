import 'package:flutter/material.dart';
import 'package:flutter_application_1/Developer.dart';
import 'package:flutter_application_1/Product.dart';
import 'package:flutter_application_1/homepage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 0: Home, 1: Product, 2: Developer

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProductPage(),
    DeveloperPage(),
  ];

  static const List<String> _titles = <String>[
    'ໜ້າຫຼັກ (Home)',
    'ລາຍການສິນຄ້າ (Product)',
    'ຂໍ້ມູນຜູ້ພັດທະນາ (Developer)',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); // ປິດ Drawer ເມື່ອກົດເລືອກໜ້າ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar ທີ່ສວຍງາມ
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 10,
        // ໃຊ້ Tooltip (Widget ທີ່ຫຼາກຫຼາຍ)
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Tooltip(
              message: 'ສະຖານະ',
              child: Icon(Icons.notifications_active),
            ),
          )
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      // Drawer ທີ່ສາມາດກົດໄປທຸກໆໜ້າ
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader ທີ່ສວຍງາມ
            UserAccountsDrawerHeader(
              accountName: const Text('samsanthai'),
              accountEmail: const Text('Student ID: [101001000]'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.flutter_dash, size: 50, color: Colors.teal),
              ),
              
            ),
            // Home Page
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blueGrey),
              title: const Text('ໜ້າຫຼັກ (Home)'),
              selected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            // Product Page
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.blueGrey),
              title: const Text('ລາຍການສິນຄ້າ (Product)'),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            // Developer Page
            ListTile(
              leading: const Icon(Icons.person_pin, color: Colors.blueGrey),
              title: const Text('ຂໍ້ມູນຜູ້ພັດທະນາ (Developer)'),
              selected: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text('ຕັ້ງຄ່າ'),
              onTap: () {
                Navigator.of(context).pop(); // ປິດ Drawer
                // ສາມາດເພີ່ມການນຳທາງໄປໜ້າຕັ້ງຄ່າໄດ້
              },
            ),
          ],
        ),
      ),
      // ໃຊ້ FloatingActionButton (Widget ທີ່ຫຼາກຫຼາຍ)
      floatingActionButton: _selectedIndex != 2 ? FloatingActionButton(
        onPressed: () {
          // ສະແດງ Dialog ເມື່ອກົດ (Widget ທີ່ຫຼາກຫຼາຍ)
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('ແຈ້ງເຕືອນ'),
                content: Text('ທ່ານກຳລັງເບິ່ງ ${_titles[_selectedIndex]}'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('ຕົກລົງ'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.favorite),
      ) : null, // ບໍ່ສະແດງໃນໜ້າ Developer
    );
  }
}