import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
   
  const CastingCards({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Container(

      margin: const EdgeInsets.only(bottom: 30),
      color: Colors.red,
      height: 180,
      width: double.infinity,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ( __, int index) =>const _CastCard() ,
      ),
      
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      color: Colors.green,
      child:  Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image: AssetImage('assets/no-image.jpg'),
                      height: 140,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
          ),

          //const SizedBox(height: 5),

          const Text(
            'actor.name asdadad asdads asdad',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}