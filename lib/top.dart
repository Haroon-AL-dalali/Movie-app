import 'package:flutter/material.dart';
import 'package:movieapp/api/api.dart';
import 'package:movieapp/home_screen.dart';
import 'package:movieapp/widgets/trending_slider.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({super.key});

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
   @override
  void initState() {
   
   setState(() {
      topRatedMovies = Api().getTopRatedMovies();
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
                    future: topRatedMovies,
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