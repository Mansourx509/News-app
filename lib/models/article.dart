class Artical{
  String author,title,description,content,url,urlToImage,publishedAt;
  Artical(this.author,this.title,this.description,this.content,this.url,this.urlToImage,this.publishedAt);
  Artical.fromjson(Map<String,dynamic>map){
    this.author=map['author'];
    this.title=map['title'];
    this.description=map['description'];
    this.content=map['content'];
    this.url=map['url'];
    this.urlToImage=map['urlToImage'];
    this.publishedAt=map['publishedAt'];

  }
}