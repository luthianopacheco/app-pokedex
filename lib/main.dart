import 'package:app_pokedex_mvc/controllers/home_page_controller.dart';
import 'package:app_pokedex_mvc/models/api_connection/pokemon_api_connection.dart';
import 'package:app_pokedex_mvc/views/description_page.dart';
import 'package:app_pokedex_mvc/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PokemonAPI()),
        ChangeNotifierProvider(
          create: (context) => HomePageController(context.read()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/description': (context) => const DescriptionPage(),
        },
      ),
    );
  }
}
