import 'package:flutter/material.dart';
import 'package:flutter_uts/pengunjung.dart';
import 'package:flutter_uts/halamandua.dart';
import 'package:flutter_uts/service/book_service.dart';

void main() {
  runApp(const MaterialApp(home: MyUno()));
}

class MyUno extends StatefulWidget {
  const MyUno({super.key});

  @override
  State<MyUno> createState() => _MyUnoState();
}

class _MyUnoState extends State<MyUno> {
  var judul = "Perpustakaan IT TELKOM SBY";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          judul = "perpustakaan IT TELKOM SBY";
        });
      }),
      body: FutureBuilder(
        future: BookService().getBook(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var _dataBook = snapshot.data;
            return GridView.builder(
                itemCount: _dataBook!.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BiodataPenyewa(
                                judul: _dataBook?.data[index].attributes.buku ??
                                    "",
                              )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                              _dataBook?.data[index].attributes.images ??
                                  "https://picsum.photos/id/238/200/300",
                            ),
                          ),
                          Text(_dataBook?.data[index].attributes.buku ?? ""),
                        ],
                      ),
                    ),
                  );
                });
            // return ListView.builder(
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   itemCount: _dataBook!.data.length,
            //   itemBuilder: ((context, index) {
            //     return GestureDetector(
            //       onTap: () {
            //         print("Berhasil ");
            //       },
            //       child: Container(
            //         padding: EdgeInsets.all(10),
            //         child: Row(
            //           children: [
            //             list
            //             Image(
            //               image: NetworkImage(
            //                 _dataBook?.data[index].attributes.images ??
            //                     "https://picsum.photos/id/238/200/300",
            //               ),
            //             ),
            //             Text(_dataBook?.data[index].attributes.buku ?? ""),
            //           ],
            //         ),
            //       ),
            //     );
            //   }),
            // );
          }
          return Container();
        }),
      ),
      // body: ListView(
      //   // scrollDirection: Axis.horizontal,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Image.asset(
      //           "assets/images/aplikasi bergerak.jpeg",
      //           height: 250,
      //           width: 200,
      //         ),
      //         Column(
      //           children: const [
      //             Text(
      //               'Aplikasi Bergerak',
      //               style: TextStyle(fontSize: 20),
      //             ),
      //             Text('138 halaman')
      //           ],
      //         ),
      //         ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const BiodataPenyewa()));
      //             },
      //             child: const Text("Pinjam")),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Image.asset(
      //           "assets/images/basis data.jpeg",
      //           height: 260,
      //           width: 200,
      //         ),
      //         Column(
      //           children: const [
      //             Text(
      //               'Basis Data',
      //               style: TextStyle(fontSize: 20),
      //             ),
      //             Text('279 halaman')
      //           ],
      //         ),
      //         ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const BiodataPenyewa()));
      //             },
      //             child: const Text("Pinjam")),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Image.asset(
      //           "assets/images/kecerdasan buatan.jpeg",
      //           height: 255,
      //           width: 200,
      //         ),
      //         Column(
      //           children: const [
      //             Text('Kecerdasan Buatan', style: TextStyle(fontSize: 20)),
      //             Text('431 halaman')
      //           ],
      //         ),
      //         ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const BiodataPenyewa()));
      //             },
      //             child: const Text("Pinjam")),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Image.asset(
      //           "assets/images/metode penelitian.jpeg",
      //           height: 220,
      //           width: 200,
      //         ),
      //         Column(
      //           children: const [
      //             Text('Metode Penilitian', style: TextStyle(fontSize: 20)),
      //             Text('372 halaman')
      //           ],
      //         ),
      //         ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const BiodataPenyewa()));
      //             },
      //             child: const Text("Pinjam")),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Image.asset(
      //           "assets/images/robotika-.jpeg",
      //           height: 320,
      //           width: 200,
      //         ),
      //         Column(
      //           children: const [
      //             Text('Robotika', style: TextStyle(fontSize: 20)),
      //             Text('283 halaman')
      //           ],
      //         ),
      //         ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const BiodataPenyewa()));
      //             },
      //             child: const Text("Pinjam")),
      //       ],
      //     ),
      //   ],
      // )
    );
  }
}
