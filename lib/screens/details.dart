import 'package:flutter/material.dart';
//import 'package:newsApp/api/news_api.dart';
import 'package:newsApp/models/article.dart';
import 'apple.dart';

class Details extends StatefulWidget {


  String author , title , description , URL ,urlToImage , publishedAt,content;
  Details(this.author , this.title , this.description,this.URL, this.urlToImage,this.publishedAt,this.content);

  @override
  _Details createState() => _Details();
}

class _Details extends State<Details> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController( length: 2 , vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("${widget.title}"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ) ,
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: new ListView (
          children: <Widget> [
            Image.network(
              _setImage(),
              width: 370,
              height: 300,
            ),
           // },
            new Padding(padding: const EdgeInsets.all(8.5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${widget.publishedAt} ",
                  style: TextStyle(color: Colors.blueAccent.shade200 ,
                      fontSize: 17.0 ,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            new Padding(padding: const EdgeInsets.all(5)),
            new Container(
              height: 350.0,
              width: 410.0,
              color: Colors.white70,
              child: new Column(
                children: <Widget>[
                  Text("Description", style: TextStyle(color: Colors.red,fontSize: 20.0 ,fontWeight: FontWeight.bold)),
                  Text("${widget.description}",style: TextStyle(color: Colors.black ,fontSize: 18.0 , fontWeight: FontWeight.bold ),)
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(8)),
            new Container(
              height: 350.0,
              width: 410.0,
              color: Colors.white70,
              child: new Column(
                children: <Widget>[
                  Text("Contetn", style: TextStyle(color: Colors.red,fontSize: 20.0 ,fontWeight: FontWeight.bold)),
                  Text("${widget.content}",
                    style: TextStyle(color: Colors.black ,
                        fontSize: 18.0 ,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            )
          ],
        ),
      ),
      //body: ,
    );
  }

   String _setImage() {

    String _image =  "${widget.urlToImage}";

    if(_image == null ) {
      return "upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg";
    } else {
      return  _image;
    }
  }
}

