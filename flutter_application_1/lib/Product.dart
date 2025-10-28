import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  // ປ່ຽນຂໍ້ມູນສິນຄ້າໃຫ້ເປັນລາຍການອາຫານ ແລະ ເຄື່ອງດື່ມ
  final List<Map<String, dynamic>> menuItems = const [
    {'name': 'ເຂົ້າປຽກເສັ້ນ', 'price': '25,000 ກີບ', 'icon': Icons.ramen_dining, 'color': Colors.redAccent},
    {'name': 'ເຝີຊີ້ນ', 'price': '30,000 ກີບ', 'icon': Icons.local_dining, 'color': Colors.orangeAccent},
    {'name': 'ສະເຕັກໄກ່', 'price': '45,000 ກີບ', 'icon': Icons.dinner_dining, 'color': Colors.brown},
    {'name': 'ກາເຟລາວ', 'price': '15,000 ກີບ', 'icon': Icons.local_cafe, 'color': Colors.blueGrey},
    {'name': 'ນ້ຳໝາກໄມ້ປັ່ນ', 'price': '20,000 ກີບ', 'icon': Icons.local_drink, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    // ໃຊ້ ListView.builder ພ້ອມ ListTile ແລະ Card
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        // ດຶງຂໍ້ມູນລາຍການປັດຈຸບັນ
        final item = menuItems[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          // ໃຊ້ Card ພ້ອມຮູບຮ່າງທີ່ສວຍງາມ ແລະ ມີສີສັນຕາມປະເພດອາຫານ
          child: Card(
            elevation: 6, // ເພີ່ມເງົາໃຫ້ເດັ່ນຂຶ້ນ
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              // Leading Icon ຕາມປະເພດອາຫານ/ເຄື່ອງດື່ມ
              leading: Icon(
                item['icon'] as IconData,
                color: item['color'] as Color, // ປ່ຽນສີຕາມລາຍການ
                size: 40,
              ),
              title: Text(
                item['name'].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                'ລາຄາ: ${item['price']}',
                style: const TextStyle(
                  color: Colors.green, // ຮັກສາສີຂຽວສໍາລັບລາຄາ
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // ປ່ຽນ trailing ໃຫ້ເໝາະສົມກັບເມນູ
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: item['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'ສັ່ງເລີຍ',
                  style: TextStyle(
                    color: item['color'] as Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              onTap: () {
                // ໃຊ້ SnackBar (Widget ທີ່ຫຼາກຫຼາຍ) ເມື່ອກົດ
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('ທ່ານເລືອກສັ່ງ: ${item['name']}'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: item['color'] as Color, // ປ່ຽນສີ SnackBar ຕາມລາຍການ
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}