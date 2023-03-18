import 'package:flutter/material.dart';
import 'package:movies/ui/views/search_view/widgets/search_delegate.dart';
import 'package:movies/ui/widgets/app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          "Buscador",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            InputChip(
                onPressed: () {
                  showSearch(context: context, delegate: MovieSearchDelegate());
                },
                label: const SizedBox(
                  height: 30,
                  width: double.infinity,
                ))
          ],
        ),
      ),
    );
  }
}
