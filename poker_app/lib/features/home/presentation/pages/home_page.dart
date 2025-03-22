import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';
import 'package:poker_app/features/home/presentation/widgets/pokemon_detail_widget.dart';
import 'package:poker_app/features/home/presentation/widgets/pokemon_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchTerm = '';
  final cubit = Modular.get<HomeCubit>();
  @override
  void initState() {
    super.initState();
    cubit.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar Pokémon por nome',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchTerm = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => cubit,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  } else if (state is PokemonListLoaded) {
                    final filtered = state.pokemons.results
                        .where((p) => p.name.toLowerCase().contains(searchTerm))
                        .toList();
                    return PokemonListWidget(
                      pokemons: state.pokemons.copyWith(results: filtered),
                      onItemTap: (item) {
                        Modular.to.pushNamed('/home/detail', arguments: item);
                      },
                    );
                  } else if (state is PokemonDetailLoaded) {
                    return PokemonDetailWidget(
                      pokemon: state.pokemon,
                      onBack: () => cubit.fetchPokemonList(),
                    );
                  } else {
                    return const Center(child: Text('Selecione um Pokémon'));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
