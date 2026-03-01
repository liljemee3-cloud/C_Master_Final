import 'package:flutter/material.dart';

void main() => runApp(const CMasterPro());

class CMasterPro extends StatelessWidget {
  const CMasterPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sections = [
      {"title": "مقدمة في لغة C", "icon": "📜", "desc": "تاريخ اللغة وأهميتها"},
      {"title": "الأساسيات (Variables)", "icon": "🔢", "desc": "المتغيرات وأنواع البيانات"},
      {"title": "الشروط (If Statements)", "icon": "⚖️", "desc": "اتخاذ القرارات في الكود"},
      {"title": "الدوال (Functions)", "icon": "⚙️", "desc": "تنظيم الكود وإعادة استخدامه"},
      {"title": "المؤشرات (Pointers)", "icon": "📍", "desc": "أقوى ميزات لغة C"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("C Master Pro - الموسوعة"),
        backgroundColor: Colors.amber[800],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            color: Colors.grey[900],
            child: ListTile(
              leading: Text(sections[index]['icon']!, style: const TextStyle(fontSize: 30)),
              title: Text(sections[index]['title']!, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
              subtitle: Text(sections[index]['desc']!, style: const TextStyle(color: Colors.white70)),
              trailing: const Icon(Icons.code, color: Colors.amber),
              onTap: () {
                // سنضيف صفحات الدروس هنا في الخطوة القادمة
              },
            ),
          );
        },
      ),
    );
  }
}
