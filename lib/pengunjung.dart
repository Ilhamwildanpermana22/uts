import 'package:flutter/material.dart';

class BiodataPenyewa extends StatelessWidget {
  const BiodataPenyewa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: const Center(
          child: Text("silahkan ke perpustakaan untuk mengambil buku")),
    );
  }
}
