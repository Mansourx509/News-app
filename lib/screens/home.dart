import 'package:flutter/material.dart';
import 'package:newsApp/api/news_api.dart';
import 'package:newsApp/models/article.dart';
import 'package:newsApp/shared_ui/nav_drawer.dart';
import 'package:newsApp/shared_ui/navigation_drawer.dart';
import 'details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  NewsApi newsApi=NewsApi();
  int page =5;
  bool loading=true;
  int currentPage=1;
  List <Artical>Articals=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsApi.FetchArticals(currentPage).then((futureArticals){
      Articals.addAll(futureArticals);

      print('*******************************');
      print(Articals);
      setState(() {
        loading=false;
        if (currentPage!=page){
          currentPage++;
        }

      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Home'),
      ),
      // drawer: NavigationDrawer(),
      drawer:   NavDrawer(),
      body: Container(
        child: loading?Center(child: CircularProgressIndicator(),):
        Container(

          child: Padding(padding:EdgeInsets.only(top: 24,left: 8,right: 8) ,
            child: GridView.builder(
                itemCount: Articals.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing:18 ,
                  childAspectRatio: 0.5,
                ),

                itemBuilder:(context,position){
                  return  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Details(Articals[position].author , Articals[position].title, Articals[position].description,
                            Articals[position].url,Articals[position].urlToImage,Articals[position].publishedAt,Articals[position].content);
                      }));
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: 150,
                            child: Image(image: NetworkImage(Articals[position].urlToImage))),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(Articals[position].title,textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(Articals[position].author.toString(),textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  );

                }
            ),
          ),),

      ),
      /* body:  Container(
     child: loading?Center(child: CircularProgressIndicator(),):ListView.builder(
     itemCount: Articals.length,itemBuilder:(BuildContext Context,int position){
       return Card(
         child: ListTile(
           title: Text(Articals[position].title),
         ),
       );
     })),*/
    );

  }
}
