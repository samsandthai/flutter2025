
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'well come ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          // ໃຊ້ Icon ທີ່ມີ animation (AnimatedIcon - Widget ທີ່ຫຼາກຫຼາຍ)
          const Icon(
            Icons.waving_hand,
            size: 80,
            color: Colors.orange,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // ເປີດ Drawer ເພື່ອສະແດງການນຳທາງ
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
            label: const Text('Go to Menu'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}