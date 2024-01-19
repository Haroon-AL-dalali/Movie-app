import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/api/api.dart';
import 'package:movieapp/api/constants.dart';
import 'package:movieapp/colors.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/widgets/back_button.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.movie,
  });
  final Movie movie;
  

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

    @override
  void initState() {
    super.initState();
    Constants.castModel =Api().getCasts(id:widget.movie.id.toString());
    print(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BacBtn(),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.movie.title.toString(),
                style: GoogleFonts.belleza(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Image.network(
                  '${Constants.imagePath}${widget.movie.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.movie.overview.toString(),
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    //textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Releas date:',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.movie.releaseDate.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Rating',
                                style: GoogleFonts.roboto(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '${widget.movie.voteAverage.toStringAsFixed(1)}/10',
                                style: GoogleFonts.roboto(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
               
               const SizedBox(
                height: 30,
               ),
               
                 SizedBox(
                child: Text('Casts', style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),),
               ),
                const SizedBox(
                height: 30,
               ),
               
               SizedBox(
                height: 150,
                child: FutureBuilder(future: Constants.castModel, builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                if(snapshot.hasData){
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){

                return Column(
                  children: [
                    CircleAvatar(
                   backgroundImage: NetworkImage(snapshot.data[index].image !=null?'https://image.tmdb.org/t/p/w500${snapshot.data[index].image}':'https://otoa-website.s3.us-east-2.amazonaws.com/profiles/no-image.png'),
                     maxRadius: 35,
                    ),
                     const SizedBox(
                      height: 10,
                    ),
                    Text('${snapshot.data[index].name}')
                  ],
                );

              }, separatorBuilder: (context,index)=>const SizedBox(width:10), itemCount:  snapshot.data.length);
                              }
                else{
                  return const Center(child: CircularProgressIndicator());
                }
                },),
               )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
