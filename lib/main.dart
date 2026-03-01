import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; // سنحتاج لإضافة هذه المكتبة

void main() => runApp(const CMasterPro());

class CMasterPro extends StatelessWidget {
  const CMasterPro({super.key});
  final String currentVersion = "1.0.0"; // إصدارك الحالي

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(version: currentVersion),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String version;
  const HomeScreen({super.key, required this.version});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    checkUpdates(); // الخوارزمية تبدأ فور تشغيل التطبيق
  }

  // خوارزمية فحص التحديث
  Future<void> checkUpdates() async {
    try {
      // رابط ملف الـ json الخاص بك على GitHub (يجب تبديل الرابط برابطك المباشر لاحقاً)
      final response = await http.get(Uri.parse('https://raw.githubusercontent.com/liljemee3-cloud/C_Master_Final/main/version.json'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['latest_version'] != widget.version) {
          showUpdateDialog();
        }
      }
    } catch (e) { print("خطأ في الاتصال"); }
  }

  void showUpdateDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("🚀 تحديث جديد متوفر!"),
        content: const Text("هناك إصدار جديد يحتوي على دروس C و Python و Dart. هل تريد التحميل؟"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("لاحقاً")),
          TextButton(onPressed: () {}, child: const Text("تحديث الآن")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("موسوعة اللغات الثلاث")),
      body: ListView(
        children: [
          _buildLanguageCard("لغة C", "أساسيات، مصفوفات، مؤشرات", Colors.blue),
          _buildLanguageCard("لغة Python", "ذكاء اصطناعي، بيانات، أتمتة", Colors.green),
          _buildLanguageCard("لغة Dart", "برمجة تطبيقات، فلاتر", Colors.cyan),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(String title, String desc, Color color) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(Icons.code, color: color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        onTap: () {},
      ),
    );
  }
}
