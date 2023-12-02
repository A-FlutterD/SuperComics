import 'package:flutter/material.dart';
import 'package:super_comics_app/widgets/superhero_list.dart';
import 'package:super_comics_app/services/superheroe_service.dart';

class SuperheroSearch extends StatefulWidget {
  const SuperheroSearch({super.key});

  @override
  State<SuperheroSearch> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<SuperheroSearch> {

  List superheroes = [];

  final searchController = TextEditingController();

  initialize() async {
    superheroes = await SuperheroeService().searchSuperheroes('search', 'A');
    setState(() {
      superheroes = superheroes;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void searchRecipes(String value) async {
    superheroes = await SuperheroeService().searchSuperheroes('search', value);
    setState(() {
      superheroes = superheroes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            hintText: 'Search superheroes',
            hintStyle: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
            ),
            prefixIconColor: Colors.white54
          ),
          onSubmitted: searchRecipes,
        ),
      ),
      body: SuperheroList(superheroes: superheroes),
    );
  }
}