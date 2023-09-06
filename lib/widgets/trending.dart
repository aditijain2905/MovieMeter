import 'package:flutter/material.dart';
import 'package:moviem_meter/description.dart';


import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {
   final List trending ;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedtext(text:'Trending Movies',size:26, color: Colors.white,),
        SizedBox(height: 30,),

         Container(
           height: 270,
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemBuilder: (context, index) {
             return InkWell(
               onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'] , description: trending[index]['overview'], bannerurl:'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'], posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], vote: trending[index]['vote_average'].toString(), launch: trending[index]['release_date'],)));
               },
               child:
               trending[index]['title']!=null ? Container(
                 width: 140,
                 child: Column(
                   children: [
                     Container(
                       height:200,
                       decoration: BoxDecoration(image: DecorationImage(
                         image: NetworkImage(
                           'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                         )
                       )),
                     ),
                     Container(
                       child: modifiedtext(text: trending[index]['title']!=null?
                        trending[index]['title']:'loading', color: Colors.white, size: 18 ,),
                     )
                   ],
                 ),
               ):Container(
                // child: modifiedtext(text: 'Data Not Available', color: Colors.white, size: 50),
               ),
             );
           },itemCount: trending.length,),
         )
       
        ],
      ),
    );
  }
}

