import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return  Scaffold(
      body: CustomScrollView(

        slivers: [

          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([

              _PosterAndTitle(),

              const _Overview(),
              const _Overview(),
              const _Overview(),
              

              const CastingCards(),

            ])
          )
        ],
      ),
      
    );
  }
}

class _CustomAppBar extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title:  Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.red,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: AssetImage('assets/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return  Container(

      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              height: 150,
            ),
          ),

          const SizedBox(width: 20),

          Column(
            children: [
              Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis,),
              Text('movie.originaltitle', style: textTheme.headline5, overflow: TextOverflow.ellipsis,),
              
              Row(
                children: [
                  const Icon(Icons.star_outlined,size: 15,color: Colors.grey),
                  const SizedBox(width: 5),
                  Text('movie.voteAverage', style: textTheme.caption,),
                  
                ],
              )
            ],
          )
        ] 
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child:Text('Ipsum velit ex elit esse velit magna cillum quis ullamco in eu sit adipisicing fugiat. Aliqua minim cupidatat qui sunt magna aute. Nostrud elit velit commodo officia anim magna consequat. Id exercitation ea Lorem officia. Anim non ullamco reprehenderit proident dolore tempor eiusmod dolor nulla.',
                    textAlign: TextAlign.justify,
                    style: const TextTheme().subtitle1,
                    )
    );
  }
}



