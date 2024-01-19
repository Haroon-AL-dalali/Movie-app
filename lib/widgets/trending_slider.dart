import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/api/constants.dart';
import 'package:movieapp/details_screen.dart';
class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length, 
        itemBuilder: (context,itemIndex,pageViewIndex){
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: 
              (context)=> DetailsScreen(movie: snapshot.data[itemIndex],),),);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 250,
                width: 200,
                child:Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}'
                ),
              ),
            ),
          );
        },
         options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
       autoPlayAnimationDuration:const Duration(seconds: 1),
         )),
    );
  }
}

class TrendingGrid extends StatelessWidget {
  const TrendingGrid({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.count(
        crossAxisCount: 2 ,
        mainAxisSpacing:30,
        crossAxisSpacing:10,
        childAspectRatio:10/20,
        children:[
          for(int index=0;index< snapshot.data!.length;index++)...{
             GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: 
              (context)=> DetailsScreen(movie: snapshot.data[index],),),);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
              
                child:Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[index].posterPath}'
                ),
              ),
            ),
        )
          }
        
        ]));
     
  
    
  }
}