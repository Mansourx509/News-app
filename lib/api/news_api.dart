import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:newsApp/models/article.dart';

class NewsApi {
  Map<String, String> headers = {'accept': 'application/json',};

  Future<List<Artical>> FetchArticals(int page) async {
    String news =
        'http://newsapi.org/v2/everything?q=apple&from=2020-08-06&to=2020-08-06&sortBy=popularity&apiKey=b0e57dd8455e485f86f9d74a00ffd14e&page=' +
            page.toString();
    http.Response response = await http.get(news, headers: headers);
    if (response.statusCode != 200) {
      return null;
    }
    var body = jsonDecode(response.body);
    var jsonArtical = body['articles'];

    //  print(body);
    List<Artical> articals = [];
    for (var item in jsonArtical) {
      articals.add(Artical.fromjson(item));

    }
    //print(articals);

    return articals;
  }


  Future<List<Artical>> FetchArticalsBitcoin(int page) async {
    String news =
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-08-08&sortBy=publishedAt&apiKey=b0e57dd8455e485f86f9d74a00ffd14e&page=' +
            page.toString();
    http.Response response = await http.get(news, headers: headers);
    if (response.statusCode != 200) {
      return null;
    }
    var body = jsonDecode(response.body);
    var jsonArtical = body['articles'];

    //  print(body);
    List<Artical> articals = [];
    for (var item in jsonArtical) {
      articals.add(Artical.fromjson(item));

    }
    //print(articals);

    return articals;
  }
  Future<List<Artical>> FetchArticalsApple(int page) async {
    String news =
        'http://newsapi.org/v2/everything?q=apple&from=2020-08-06&to=2020-08-06&sortBy=popularity&apiKey=b0e57dd8455e485f86f9d74a00ffd14e&page=' +
            page.toString();
    http.Response response = await http.get(news, headers: headers);
    if (response.statusCode != 200) {
      return null;
    }
    var body = jsonDecode(response.body);
    var jsonArtical = body['articles'];

    //  print(body);
    List<Artical> articals = [];
    for (var item in jsonArtical) {
      articals.add(Artical.fromjson(item));

    }
    //print(articals);

    return articals;
  }
  Future<List<Artical>> FetchArticalsbusiness(int page) async {
    String news =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0e57dd8455e485f86f9d74a00ffd14e&page=' +
            page.toString();
    http.Response response = await http.get(news, headers: headers);
    if (response.statusCode != 200) {
      return null;
    }
    var body = jsonDecode(response.body);
    var jsonArtical = body['articles'];

    //  print(body);
    List<Artical> articals = [];
    for (var item in jsonArtical) {
      articals.add(Artical.fromjson(item));

    }
    //print(articals);

    return articals;
  }
}
