import 'package:flutter/material.dart';
import 'package:super_comics_app/screens/favorite_superheroe_screen.dart';
import 'package:super_comics_app/screens/superhero_search.dart';


class ViewMain extends StatelessWidget {
  const ViewMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'to Super Comics App',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              'https://www.cbc.ca/kids/images/Comic_book_header_-_1140x641.jpg',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SuperheroSearch()));
              },
              child: const Text('Get to Search'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteSuperheroesScreen()));
              },
              child: const Text('Get to See Favorites'),
            ),
          ],
        ),
      )
    );
  }
}