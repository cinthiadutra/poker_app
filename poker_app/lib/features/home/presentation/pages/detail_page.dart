import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';
import 'package:poker_app/features/home/presentation/widgets/pokemon_detail_widget.dart';

class PokemonDetailPage extends StatelessWidget {
  final int pokemonId;

  const PokemonDetailPage({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<HomeCubit>()..fetchPokemonDetail(pokemonId);

    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: BlocProvider.value(
        value: cubit,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else if (state is PokemonDetailLoaded) {
              return PokemonDetailWidget(
                pokemon: state.pokemon,
                onBack: () => Modular.to.pop(),
              );
            } else {
              return const Center(child: Text('Carregando...'));
            }
          },
        ),
      ),
    );
  }
}
