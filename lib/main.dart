import 'package:flutter/material.dart';

void main() {
  runApp(const CMasterPro());
}

class CMasterPro extends StatelessWidget {
  const CMasterPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C Master Pro',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة بأسماء الأقسام العلمية التي سنملؤها
    final List<Map<String, String>> categories = [
      {"title": "الأساسيات (Basics)", "icon": "🏗️"},
      {"title": "المصفوفات (Arrays)", "icon": "📊"},
      {"title": "المؤشرات (Pointers)", "icon": "📍"},
      {"title": "خوارزميات البحث", "icon": "🔍"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("موسوعة C للمحترفين"),
        centerTitle: true,
        backgroundColor: Colors.amber[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Text(categories[index]['icon']!, style: const TextStyle(fontSize: 30)),
                title: Text(categories[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text("انقر للتعلم والغوص في العلوم"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // هنا سنبرمج الانتقال للدروس لاحقاً
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

