import 'package:dio/dio.dart';
import 'package:flutter_uts/model/book_response.dart';

class BookService {
  Future<ListDataBookResponse> getBook() async {
    final response = await Dio().get("http://localhost:1337/api/beritas");

    return ListDataBookResponse.fromJson(response.data);
  }
}
