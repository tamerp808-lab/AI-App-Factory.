import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const SmartWallet(),
    );
  }
}

class SmartWallet extends StatelessWidget {
  const SmartWallet({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F15),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("مرحباً بك،", style: TextStyle(color: Colors.white54, fontSize: 18)),
                  CircleAvatar(backgroundColor: Colors.deepPurple, child: Icon(Icons.person, color: Colors.white)),
                ],
              ),
              const Text("مصطفى محمود", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Colors.deepPurple, Colors.blueAccent]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("إجمالي الرصيد", style: TextStyle(color: Colors.white70, fontSize: 16)),
                    SizedBox(height: 10),
                    Text("\$12,500.00", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text("**** **** **** 4582", style: TextStyle(color: Colors.white54, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text("العمليات الأخيرة", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Expanded(
                child: ListView(
                  children: [
                    _buildTransaction(Icons.shopping_bag, "متجر آبل", "-\$999", Colors.orange),
                    _buildTransaction(Icons.fastfood, "مطعم", "-\$45", Colors.redAccent),
                    _buildTransaction(Icons.work, "راتب العمل", "+\$4500", Colors.greenAccent),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransaction(IconData icon, String title, String amount, Color color) {
    return ListTile(
      leading: Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: color)),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      trailing: Text(amount, style: TextStyle(color: amount.contains('+') ? Colors.greenAccent : Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
