import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_providers.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';



void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(),lazy: false,)

      ],
      child: const MyApp(),

    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home':(__) => const HomeScreen(),
        'details':(__) => const DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(),
      color: Colors.blue,
    );
  }
}
