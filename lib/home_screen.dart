import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/api/api.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/widgets/movies_slider.dart';
import 'package:movieapp/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

 Future<List<Movie>>? trendingMovies ;
 Future<List<Movie>>? topRatedMovies;
 Future<List<Movie>>? upcomingMovies;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
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
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Move',
                style: GoogleFonts.roboto(fontSize: 25),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TrendingSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Top Movie',
                style: GoogleFonts.roboto(fontSize: 22),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MoviesSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Upcoming Movie',
                style: GoogleFonts.roboto(fontSize: 25),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: upcomingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MoviesSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
        
      ),

    );
    
    
  }
}
