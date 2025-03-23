import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/core/network/pokeapi_endpoint.dart';
import 'package:poker_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:poker_app/features/home/data/datasources/pokemon_datasource_impl.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository_impl.dart';
import 'package:poker_app/features/home/presentation/cubit/detail_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/pages/detail_page.dart';
import 'package:poker_app/features/home/presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  binds(i) {
    i.addSingleton<PokemonRepository>(
        () => PokemonRepositoryImpl(datasource: i.get<PokemonDatasource>()));
    i.addSingleton(() => HomeCubit(Modular.get<PokemonRepository>()));
    i.addSingleton(
        () => DetailCubit(repository: Modular.get<PokemonRepository>()));

    i.addLazySingleton<Dio>(
        () => Dio(BaseOptions(baseUrl: PokeApiEndpoints.baseUrl)));

    i.addSingleton<PokemonDatasource>(
      () => PokemonDatasourceImpl(dio: i.get<Dio>()),
    );
  }

  @override
  routes(r) {
    r
      ..child('/',
          child: (ctx) => HomePage(
                cubit: Modular.get<HomeCubit>(),
              ))
      ..child(
        '/detail',
        child: (ctx) => PokemonDetailPage(
          pokemonId: r.args.data,
        ),
      );
  }
}
