import 'package:flutter/material.dart';

class BiodataPenyewa extends StatelessWidget {
  String? judul;
  BiodataPenyewa({super.key, this.judul});

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
      body: Column(
        children: [
          Text(judul!),
          Text("silahkan ke perpustakaan untuk mengambil buku"),
        ],
      ),
    );
  }
}
