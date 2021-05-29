class Article{
  String title;
  String summary;
  String published;
  Article(
    {
     this.title,this.published,this.summary

    }
  );
  factory Article.fromJson(Map<String,dynamic>json){
    return Article(
      title: json['title'] as String,
      summary: json['summary'] as String,
      published: json['published']

    );
  }
}