import 'package:flutter/material.dart';
import 'package:movieapp/api/api.dart';
import 'package:movieapp/home_screen.dart';
import 'package:movieapp/widgets/trending_slider.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  initState(){
   
    setState(() {
      trendingMovies = Api().getTrendingMovies();
      print(trendingMovies.toString());
    
    });
     super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
   
      
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/net7.png',
          fit: BoxFit.cover,
          height: 90,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body:      SizedBox(
                child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TrendingGrid(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
    );
  }
}