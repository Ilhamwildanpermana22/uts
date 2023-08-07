import 'package:flutter/material.dart';
import 'package:flutter_uts/halamandua.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PinjamanBuku extends StatefulWidget {
  const PinjamanBuku({super.key});

  @override
  State<PinjamanBuku> createState() => _PinjamanBukuState();
}

class _PinjamanBukuState extends State<PinjamanBuku> {
  final apiUrl = 'http://localhost:1337/api/beritas';

  List<dynamic> data = [];
  bool isLoading = true;

  final bukuController = TextEditingController();
  final isiController = TextEditingController();
  final imagesController = TextEditingController();

  Future<void> addData() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'buku': bukuController.text,
        'isi': isiController.text,
        'images': imagesController.text
      }),
    );

    if (response.statusCode == 201) {
      bukuController.clear();
      imagesController.clear();
      isiController.clear();
    } else {
      throw Exception('Failed to add data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Color.fromARGB(255, 71, 185, 230)),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => MyUno()),
            );
          },
        ),
        title: Text(
          "Tambah Buku",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          TextField(
            controller: bukuController,
            decoration: InputDecoration(
              labelText: 'Buku',
            ),
          ),
          TextField(
            controller: isiController,
            decoration: InputDecoration(
              labelText: 'Isi',
            ),
          ),
          TextField(
            controller: imagesController,
            decoration: InputDecoration(
              labelText: 'Link Images',
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              addData();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyUno()),
              );
            },
            child: Text(
              'tambahkan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 81, 186, 228),
            ),
          ),
        ]),
      ),
    );
  }
}
