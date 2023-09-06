import 'package:flutter/material.dart';
import 'package:moviem_meter/utils/text.dart';
import 'package:moviem_meter/widgets/toprated.dart';
import 'package:moviem_meter/widgets/trending.dart';
import 'package:moviem_meter/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';



void main() =>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Home() ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.green),
    );
  }

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies=[];
  List topRatedmovies =[];
  List tv=[];
  final String apikey='a4656b904a8d457e5897d5b0eef7eded';
  final readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDY1NmI5MDRhOGQ0NTdlNTg5N2Q1YjBlZWY3ZWRlZCIsInN1YiI6IjY0ZjhhOTMxNWYyYjhkMDBjNDM1MmM3YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NLSV9fm9eiZ0PNNc57W1O7Rc25NhenOO7xnkncLaIYU';
 @override
  void initState(){
   super.initState();
    loadmovies();

  }


  loadmovies() async{
   TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
   logConfig: ConfigLogger(
     showLogs: true,
     showErrorLogs: true
   ) );

   Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
   Map topRatedmoviesResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
   Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();


   print(trendingResult);
   setState(() {
     trendingmovies = trendingResult['results'];
     topRatedmovies = topRatedmoviesResult['results'];
     tv = tvResult['results'];
   });
   print(tv);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: modifiedtext(text:'Movie Meter', color: Colors.black, size: 25,),),

      body: ListView(
        children: [
          TV(tv:tv),
          TopRated(toprated: topRatedmovies),
          TrendingMovies(trending:trendingmovies)
        ],
      ),


    );
  }
}
