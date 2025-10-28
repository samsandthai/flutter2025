import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ໃຊ້ CustomScrollView ເພື່ອໃຫ້ AppBar ເຄື່ອນໄຫວໄດ້
    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar (Widget ທີ່ນອກເໜືອຈາກທີ່ຮຽນ)
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'ຂໍ້ມູນຜູ້ພັດທະນາ',
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    offset: Offset(1, 1),
                    blurRadius: 3,
                  )
                ],
              ),
            ),
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.cyan],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                // ໃຊ້ Hero Widget ເພື່ອສ້າງ Animation ງາມໆ (Widget ທີ່ນອກເໜືອຈາກທີ່ຮຽນ)
                child: Hero(
                  tag: 'developer_image_tag',
                  child: CircleAvatar(
                    radius: 60,
                    // ຕ້ອງໃຊ້ຮູບຂອງນັກສຶກສາເອງ, ປ່ຽນ 'assets/my_image.jpg' ເປັນ Path ທີ່ຖືກຕ້ອງ
                    // ສໍາລັບການທົດສອບ, ຂ້ອຍຈະໃຊ້ Placeholder Icon ກ່ອນ
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 80, color: Colors.cyan),
                    // backgroundImage: AssetImage('assets/my_image.jpg'), // ຖ້າຕ້ອງການໃຊ້ຮູບຈິງ
                  ),
                ),
              ),
            ),
          ),
        ),
        // SliverList ເພື່ອສະແດງເນື້ອໃນ
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'ຊື່ ແລະ ນາມສະກຸນ:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ທ້າວ/ນາງ [ຊື່ ນາມສະກຸນ ນັກສຶກສາ]',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                    Divider(height: 30, thickness: 1),
                    Text(
                      'ຂໍ້ມູນເພີ່ມເຕີມ:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    // ໃຊ້ Wrap ພ້ອມ Chip (Widget ທີ່ຫຼາກຫຼາຍ)
                    Wrap(
                      spacing: 8.0, // ໄລຍະຫ່າງຕາມແນວນອນ
                      runSpacing: 4.0, // ໄລຍະຫ່າງຕາມແນວຕັ້ງ
                      children: <Widget>[
                        Chip(
                          avatar: Icon(Icons.code, color: Colors.indigo),
                          label: Text('Flutter Developer'),
                          backgroundColor: Colors.pinkAccent,
                        ),
                        Chip(
                          avatar: Icon(Icons.school, color: Colors.orange),
                          label: Text('ນັກສຶກສາ [ຊັ້ນຮຽນ]'),
                          backgroundColor: Colors.orange,
                        ),
                        Chip(
                          avatar: Icon(Icons.email, color: Colors.red),
                          label: Text('[ອີເມວ/ເບີໂທ]'),
                          backgroundColor: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // ໃຊ້ Container ທີ່ມີ Decoration
                    
                  ],
                ),
              ),
              const SizedBox(height: 50), // ໄລຍະຫ່າງດ້ານລຸ່ມ
            ],
          ),
        ),
      ],
    );
  }
}