import 'package:flutter/material.dart';
import 'package:flutter_uts/pengunjung.dart';
import 'package:flutter_uts/halamandua.dart';

void main() {
  runApp(const MaterialApp(home: MyUno()));
}

class MyUno extends StatefulWidget {
  const MyUno({super.key});

  @override
  State<MyUno> createState() => _MyUnoState();
}

class _MyUnoState extends State<MyUno> {
  var judul = "Perpustakaan Gemoy IT TELKOM SBY";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(judul)),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            judul = "perpustakaan IT TELKOM SBY";
          });
        }),
        body: ListView(
          // scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/aplikasi bergerak.jpeg",
                  height: 250,
                  width: 200,
                ),
                Column(
                  children: const [
                    Text(
                      'Aplikasi Bergerak',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('138 halaman')
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BiodataPenyewa()));
                    },
                    child: const Text("Pinjam")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/basis data.jpeg",
                  height: 260,
                  width: 200,
                ),
                Column(
                  children: const [
                    Text(
                      'Basis Data',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('279 halaman')
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BiodataPenyewa()));
                    },
                    child: const Text("Pinjam")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/kecerdasan buatan.jpeg",
                  height: 255,
                  width: 200,
                ),
                Column(
                  children: const [
                    Text('Kecerdasan Buatan', style: TextStyle(fontSize: 20)),
                    Text('431 halaman')
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BiodataPenyewa()));
                    },
                    child: const Text("Pinjam")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/metode penelitian.jpeg",
                  height: 220,
                  width: 200,
                ),
                Column(
                  children: const [
                    Text('Metode Penilitian', style: TextStyle(fontSize: 20)),
                    Text('372 halaman')
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BiodataPenyewa()));
                    },
                    child: const Text("Pinjam")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/robotika-.jpeg",
                  height: 320,
                  width: 200,
                ),
                Column(
                  children: const [
                    Text('Robotika', style: TextStyle(fontSize: 20)),
                    Text('283 halaman')
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BiodataPenyewa()));
                    },
                    child: const Text("Pinjam")),
              ],
            ),
          ],
        ));
  }
}
