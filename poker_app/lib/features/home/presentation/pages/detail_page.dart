import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/core/utils/app_colors.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/presentation/cubit/detail_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';
import 'package:poker_app/features/home/presentation/widgets/pokemon_detail_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  final int pokemonId;
final DetailCubit? injectedCubit;


  const PokemonDetailPage({super.key, required this.pokemonId, this.injectedCubit});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
late final DetailCubit _cubit;
  @override
  void initState() {
    super.initState();
     _cubit = widget.injectedCubit ?? Modular.get<DetailCubit>();
  _cubit.fetchPokemonDetail(widget.pokemonId);
  }

  @override
  void dispose() {
    _cubit.close(); // evita memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.secundary,
          title: Text('Detalhes do Pokémon',
              style: TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.bold))),
      body: BlocConsumer<DetailCubit, HomeState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return const Center(
              child: Text(
                'Erro ao carregar detalhes.',
                style: TextStyle(color: Colors.red),
              ),
            );
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
    );
  }
}
