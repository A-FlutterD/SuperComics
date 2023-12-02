import 'package:flutter/material.dart';
import 'package:super_comics_app/models/superhero.dart';
import 'package:super_comics_app/repositories/superhero_repository.dart';

class SuperheroList extends StatefulWidget {
  const SuperheroList({super.key, required this.superheroes});

  final List superheroes;

  @override
  State<SuperheroList> createState() => _SuperheroListState();
}

class _SuperheroListState extends State<SuperheroList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: widget.superheroes.length,
        itemBuilder: (context, index) {
          return SuperheroItem(superhero: widget.superheroes[index]);
        });
  }
}

class SuperheroItem extends StatefulWidget {
  const SuperheroItem({super.key, required this.superhero});

  final Superhero superhero;

  @override
  State<SuperheroItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<SuperheroItem> {
  bool isFavorite = false;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    isFavorite = await SuperheroRepository().isFavorite(widget.superhero);
    if (mounted) {
      setState(() {
        isFavorite = isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final icon =
        Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.grey);
    return GestureDetector(
      child: SafeArea(
        child: Card(
          elevation: 2,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Image.network(widget.superhero.image, fit: BoxFit.fill),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          isFavorite
                              ? SuperheroRepository().insert(widget.superhero)
                              : SuperheroRepository().delete(widget.superhero.id);
                        },
                        icon: icon,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Gender: ${widget.superhero.gender}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Name: ${widget.superhero.name}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Intelligence: ${widget.superhero.intelligence}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
