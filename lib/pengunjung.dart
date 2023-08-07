// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailBuku extends StatelessWidget {
  String? judul;
  String? image;
  String? deskripsi;
  DetailBuku({super.key, this.judul, this.image, this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Buku"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.network(image!),
            SizedBox(height: 20),
            Text(judul!),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Divider(
                indent: 2,
                thickness: 2,
                height: 2,
              ),
            ),
            const Text("silahkan ke perpustakaan untuk mengambil buku"),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
          ),
          onPressed: () {},
          child: const Text("Pinjam Buku"),
        ),
      ),
    );
  }
}
