import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/core/network/dio_client.dart';
import 'package:poker_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:poker_app/features/home/data/datasources/pokemon_datasource_impl.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository_impl.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/pages/detail_page.dart';
import 'package:poker_app/features/home/presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  binds(i) {
    i.addSingleton<PokemonRepository>(
        () => PokemonRepositoryImpl(datasource: i.get<PokemonDatasource>()));
    i.addSingleton(() => HomeCubit());

    i.addLazySingleton<DioClient>(() => DioClient());
    i.addSingleton<PokemonDatasource>(
      () => PokemonDatasourceImpl(),
    );
  }

  @override
  routes(r) {
    r
      ..child('/', child: (ctx) => HomePage())
      ..child(
      '/detail', child:(ctx) => PokemonDetailPage(
        pokemonId: r.args.data,
      ),
      );
  }
}
