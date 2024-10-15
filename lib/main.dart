import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(TreeApp());
}

class TreeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ข้อมูลต้นไม้',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: TreeListScreen(),
    );
  }
}

// หน้าจอรายการต้นไม้
class TreeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายการต้นไม้',
          style: GoogleFonts.lato(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: treeData.length,
          itemBuilder: (context, index) {
            final tree = treeData[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    tree['imageAsset'],
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                title:
                    Text(tree['name'], style: GoogleFonts.lato(fontSize: 18)),
                subtitle: Text(tree['shortDescription']),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TreeDetailScreen(tree: tree, index: index),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// หน้าจอรายละเอียดต้นไม้
class TreeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> tree;
  final int index;

  TreeDetailScreen({required this.tree, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tree['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    tree['imageAsset'],
                    width: constraints.maxWidth, // กำหนดขนาดตามหน้าจอ
                    height: constraints.maxWidth * 0.6, // อัตราส่วนภาพ
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              tree['name'],
              style:
                  GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              tree['description'],
              style: GoogleFonts.lato(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// ข้อมูล JSON สำหรับต้นไม้ (ลบข้อมูลต้นไม้สื่อความหมายออก)
const List<Map<String, dynamic>> treeData = [
  {
    "name": "ต้นไม้ประโยชน์",
    "imageAsset": "assets/images/tree1.jpg",
    "shortDescription": "ต้นไม้ที่ให้ประโยชน์ทั้งด้านสิ่งแวดล้อมและการใช้สอย",
    "description":
        "ต้นไม้มีบทบาทสำคัญในการสร้างสมดุลทางธรรมชาติ ช่วยลดมลพิษทางอากาศ ให้ร่มเงา และยังเป็นที่อยู่อาศัยของสิ่งมีชีวิตหลายชนิด ต้นไม้หลายชนิดยังสามารถนำมาใช้ทำเป็นยา อาหาร หรือเครื่องใช้ในชีวิตประจำวันได้อีกด้วย."
  },
  {
    "name": "ข้อดีของการปลูกต้นไม้",
    "imageAsset": "assets/images/tree2.jpg",
    "shortDescription": "ปลูกต้นไม้ช่วยให้สภาพแวดล้อมดีขึ้น",
    "description":
        "การปลูกต้นไม้ไม่เพียงแต่ช่วยเพิ่มออกซิเจนในบรรยากาศ แต่ยังช่วยป้องกันการกัดเซาะของดิน ช่วยลดอุณหภูมิในพื้นที่เมืองใหญ่ และสร้างความร่มรื่นให้กับผู้คนที่อาศัยอยู่ในบริเวณใกล้เคียง."
  }
];
