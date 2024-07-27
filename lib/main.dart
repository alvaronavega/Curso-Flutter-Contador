import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  bool get seCheio => count == 10;
  bool get seVazio => count == 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/image.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              seCheio ? 'Lotação máxima' : "Pode entrar",
              style:  TextStyle(color: seCheio ? Colors.red : Colors.white, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                "$count",
                style: const TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: seVazio ? Colors.white70 : Colors.white,
                    fixedSize: const Size(100, 50), // Largura 100, Altura 50
                    overlayColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Ajuste o raio da borda
                    ),
                  ),
                  onPressed: seVazio ? null : decrement,
                  child: const Text(
                    "Saiu",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 30), // Espaço entre os botões
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:seCheio ? Colors.red : Colors.black,
                    backgroundColor:seCheio ? Colors.white70 : Colors.white,
                    fixedSize: const Size(100, 50),
                    // Largura 100, Altura 50
                    overlayColor: Colors.green,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Ajuste o raio da borda
                    ),
                  ),
                  onPressed: seCheio ? null : increment,
                  child: const Text(
                    "Entrou",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
