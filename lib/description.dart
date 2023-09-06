import 'package:flutter/material.dart';
import 'package:moviem_meter/utils/text.dart';
class Description extends StatelessWidget {
  final String name , description , bannerurl , posterurl , vote , launch;

  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.black12,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child:Stack(
                children: [
                  Positioned(child: Container(height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(bannerurl, fit:BoxFit.cover,))),
                  Positioned(
                      bottom: 10,

                      child: modifiedtext(text: 'Average Rating - '+vote, color: Colors.white, size: 18,))
                ],
              ) ,
            ),

            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),

              child: modifiedtext(text: name!=null?name:'Not Loaded', color: Colors.white, size: 18,),
            ),
            Container(
              padding: EdgeInsets.only(left:10),
            child: modifiedtext(text: 'Releasing om - '+launch, color: Colors.white, size: 18),),
            SizedBox(
              height: 15,
            ),
            Row(children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                  child: modifiedtext(text: description, color: Colors.white, size: 18),
                ),
              )
            ],)

          ],
        ),
      ),
    );
  }
}
