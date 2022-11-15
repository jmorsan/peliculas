import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {
   
  final List<Movie>? movies;

  const CardSwiper({Key? key, this.movies}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.red,
      child: Swiper(
        itemCount:10,
        layout: SwiperLayout.STACK, 
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( __, int index) {

          
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context,'details' , arguments:'movie-instance') ,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/loading.gif'), 
                image: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                ),
            ),
          );
        } ,
      ),
    );
  }
}