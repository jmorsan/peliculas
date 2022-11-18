import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_providers.dart';
import  'package:peliculas/widgets/card_swiper.dart';
import 'package:peliculas/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    
    return  Scaffold(
      appBar: AppBar(
         title: const Text('HomeScreen'),
         elevation: 0,
         actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search_outlined),
            )
         ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children:  [
             CardSwiper(movies: moviesProvider.onDisplayMovies),
             CardSwiper(movies: moviesProvider.popularMovies),
             
             MovieSlider(
              movies: moviesProvider.popularMovies,
              title:'Populares',
            ),
             
          ],),
      )
    );
  }
}