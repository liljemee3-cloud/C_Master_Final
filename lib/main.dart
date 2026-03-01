import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const CMasterPro());

class CMasterPro extends StatelessWidget {
  const CMasterPro({super.key});
  final String currentVersion = "1.0.0"; // رقم إصدارك الحالي

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
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
    checkUpdates(); // يبحث عن تحديث فور تشغيل التطبيق
  }

  Future<void> checkUpdates() async {
    try {
      // رابط ملف الفحص (سننشئه في الخطوة التالية)
      final response = await http.get(Uri.parse('https://raw.githubusercontent.com/liljemee3-cloud/C_Master_Final/main/version.json'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['latest_version'] != widget.version) {
          showUpdateDialog();
        }
      }
    } catch (e) {
      debugPrint("لم يتم العثور على ملف التحديث بعد");
    }
  }

  void showUpdateDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("🚀 تحديث جديد!"),
        content: const Text("هناك دروس جديدة في C و Python متوفرة الآن. هل تريد التحميل؟"),
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
      appBar: AppBar(
        title: const Text("C Master Pro - الموسوعة"),
        backgroundColor: Colors.amber[900],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _buildLanguageCard("لغة C (الأساس والقوة)", "خوارزميات، مصفوفات، مؤشرات", Colors.blue, "🏗️"),
          _buildLanguageCard("لغة Python (الذكاء)", "أمن سيبراني، ذكاء اصطناعي", Colors.green, "🐍"),
          _buildLanguageCard("لغة Dart (التطبيقات)", "برمجة الواجهات وفلاتر", Colors.cyan, "🎯"),
          const SizedBox(height: 20),
          Center(child: Text("الإصدار الحالي: ${widget.version}", style: const TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(String title, String desc, Color color, String icon) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.grey[900],
      child: ListTile(
        leading: Text(icon, style: const TextStyle(fontSize: 30)),
        title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        subtitle: Text(desc, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.amber),
        onTap: () {
          // هنا سنضع الألغاز والخوارزميات لاحقاً
        },
      ),
    );
  }
}
