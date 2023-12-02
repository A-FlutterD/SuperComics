import 'package:flutter/material.dart';import 'package:super_comics_app/models/superhero.dart';
import 'package:super_comics_app/repositories/superhero_repository.dart';

class FavoriteSuperheroes extends StatefulWidget {
  const FavoriteSuperheroes({super.key});

  @override
  State<FavoriteSuperheroes> createState() => _FavoriteRecipesState();
}

class _FavoriteRecipesState extends State<FavoriteSuperheroes> {
  SuperheroRepository? _superheroRepository;
  List<Superhero>? _superheroes;
  int? _numberOfElements;

  initialize() async {
    _superheroes = await _superheroRepository?.getAll() ?? [];
    _numberOfElements = await _superheroRepository?.getCount();
    setState(() {
      _superheroes = _superheroes;
      _numberOfElements = _numberOfElements;
    });
  }

  @override
  void initState() {
    _superheroRepository = SuperheroRepository();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Número de elementos en la base de datos: ${_numberOfElements ?? 0}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      _numberOfElements == 0
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("No hay elementos en la base de datos."),
            )
          : Expanded(
              child: ListView.builder(
                  itemCount: _superheroes?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                              const Text("Name: ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(_superheroes?[index].name ?? ""),
                          ],) 
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                              const Text("Gender: ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(_superheroes?[index].gender ?? ""),
                          ],) 
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                              const Text("Intelligence: ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(_superheroes?[index].intelligence ?? ""),
                          ],) 
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(_superheroes?[index].image ?? ""),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _superheroRepository
                                  ?.delete(_superheroes?[index].id ?? "");
                              initialize();
                            },
                            child: const Text("Delete"),
                          ),
                        ),
                      ]),
                    );
                  }))
    ]);
  }
}
