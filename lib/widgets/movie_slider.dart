
import 'package:flutter/material.dart';

//imageCache.clear()

void main() => runApp(const MovieSlider());

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ),

           const SizedBox(height: 5),  

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( __ , int index) {
                return _MoviePoster();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget{

@override
Widget build (BuildContext context){
  
  return Container(
    width: 130,
    height: 190,
    color: Colors.green,
    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: Column(
      children:  [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: AssetImage('assets/no-image.jpg'),
              width: 130,
              height: 150,
              fit: BoxFit.cover,
              ),
          ),
        ),

          const SizedBox(height: 5),

          const Text(
            'Starwars: El retorno del nuevo jedi',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            ),
      ],
    ),
  );
}


}
