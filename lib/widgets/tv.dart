import 'package:flutter/material.dart';


import '../utils/text.dart';

class TV extends StatelessWidget {
  final List tv ;

  const TV({super.key, required this.tv});

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

                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height:200,
                          decoration: BoxDecoration(image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']
                              )
                          )),
                        ),
                        Container(
                          child: modifiedtext(text: tv[index]['original_name']!=null?
                          tv[index]['original_name']:'loading', color: Colors.white, size: 18 ,),
                        )
                      ],
                    ),
                  ),
                );
              },itemCount: tv.length,),
          )

        ],
      ),
    );
  }
}
