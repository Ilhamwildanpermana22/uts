import 'package:flutter/material.dart';
import 'package:flutter_uts/peminjaman.dart';
import 'package:flutter_uts/pengunjung.dart';
import 'package:flutter_uts/halamandua.dart';
import 'package:flutter_uts/service/book_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(home: MyUno()));
}

class MyUno extends StatefulWidget {
  const MyUno({super.key});

  @override
  State<MyUno> createState() => _MyUnoState();
}

class _MyUnoState extends State<MyUno> {
  List<dynamic> data = [];
  Future<void> deleteData(String id) async {
    final response =
        await http.delete(Uri.parse('http://localhost:1337/api/beritas/$id'));

    if (response.statusCode == 200) {
      fetchData();
    } else {
      throw Exception('Failed to delete data');
    }
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:1337/api/beritas/'));

      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  var judul = "Perpustakaan IT TELKOM SBY";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PinjamanBuku(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: BookService().getBook(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var _dataBook = snapshot.data;
              return GridView.builder(
                  itemCount: _dataBook!.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title:
                                  Text(_dataBook.data[index].attributes.buku),
                              content:
                                  Text(_dataBook.data[index].attributes.isi),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('keluar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('hapus'),
                                  onPressed: () {
                                    deleteData(
                                        _dataBook.data[index].id.toString());
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: NetworkImage(
                                _dataBook.data[index].attributes.images,
                              ),
                              width: 350,
                              height: 300,
                            ),
                            Text(_dataBook.data[index].attributes.buku),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
