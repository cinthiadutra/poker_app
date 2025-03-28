import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/core/network/pokeapi_endpoint.dart';
import 'package:poker_app/features/home/data/datasources/pokemon_datasource_impl.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late PokemonDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = PokemonDatasourceImpl(dio: mockDio); // Injeção manual
  });

  group('PokemonDatasourceImpl', () {
    test('fetchPokemonList returns PokemonListResponse', () async {
      final mockData = {
        'count': 1,
        'next': null,
        'previous': null,
        'results': [
          {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'}
        ]
      };

      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          data: mockData,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await datasource.fetchPokemonList();

      expect(result, isA<PokemonListResponse>());
      expect(result.results.first.name, 'bulbasaur');
    });

    test('getPokemonById returns Pokemon', () async {
      final mockData = <String, dynamic>{
        'id': 1,
        'name': 'bulbasaur',
        'abilities': [],
        "sprites": {
          "back_default":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/12.png",
          "back_female":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/female/12.png",
          "back_shiny":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/12.png",
          "back_shiny_female":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/female/12.png",
          "front_default":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png",
          "front_female":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/female/12.png",
          "front_shiny":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/12.png",
          "front_shiny_female":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/female/12.png",
          "other": {
            "dream_world": {
              "front_default":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/12.svg",
              "front_female": null
            },
            "home": {
              "front_default":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/12.png",
              "front_female":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/female/12.png",
              "front_shiny":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/12.png",
              "front_shiny_female":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/female/12.png"
            },
            "official-artwork": {
              "front_default":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png",
              "front_shiny":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/12.png"
            },
            "showdown": {
              "back_default":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/12.gif",
              "back_female":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/female/12.gif",
              "back_shiny":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/shiny/12.gif",
              "back_shiny_female": null,
              "front_default":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/12.gif",
              "front_female":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/female/12.gif",
              "front_shiny":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/12.gif",
              "front_shiny_female":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/female/12.gif"
            }
          },
          "versions": {
            "generation-i": {
              "red-blue": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/12.png",
                "back_gray":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/gray/12.png",
                "back_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/back/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/12.png",
                "front_gray":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/gray/12.png",
                "front_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/12.png"
              },
              "yellow": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/12.png",
                "back_gray":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/gray/12.png",
                "back_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/transparent/back/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/12.png",
                "front_gray":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/gray/12.png",
                "front_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/transparent/12.png"
              }
            },
            "generation-ii": {
              "crystal": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/shiny/12.png",
                "back_shiny_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/back/shiny/12.png",
                "back_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/back/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/shiny/12.png",
                "front_shiny_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/shiny/12.png",
                "front_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/12.png"
              },
              "gold": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/shiny/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/shiny/12.png",
                "front_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/transparent/12.png"
              },
              "silver": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/shiny/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/shiny/12.png",
                "front_transparent":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/transparent/12.png"
              }
            },
            "generation-iii": {
              "emerald": {
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/shiny/12.png"
              },
              "firered-leafgreen": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/shiny/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/shiny/12.png"
              },
              "ruby-sapphire": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/shiny/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/shiny/12.png"
              }
            },
            "generation-iv": {
              "diamond-pearl": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/12.png",
                "back_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/female/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/shiny/12.png",
                "back_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/shiny/female/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/12.png",
                "front_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/female/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/shiny/12.png",
                "front_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/shiny/female/12.png"
              },
              "heartgold-soulsilver": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/12.png",
                "back_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/female/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/shiny/12.png",
                "back_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/shiny/female/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/12.png",
                "front_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/female/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/shiny/12.png",
                "front_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/shiny/female/12.png"
              },
              "platinum": {
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/12.png",
                "back_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/female/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/shiny/12.png",
                "back_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/shiny/female/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/12.png",
                "front_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/female/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/shiny/12.png",
                "front_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/shiny/female/12.png"
              }
            },
            "generation-v": {
              "black-white": {
                "animated": {
                  "back_default":
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/12.gif",
                  "back_female":
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/female/12.gif",
                  "back_shiny":
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/shiny/12.gif",
                  "back_shiny_female":
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/shiny/female/12.gif",
                  "front_default":
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/12.gif",
                  "front_female":
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/female/12.gif",
                  "front_shiny":
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/shiny/12.gif",
                  "front_shiny_female":
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/shiny/female/12.gif"
                },
                "back_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/12.png",
                "back_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/female/12.png",
                "back_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/shiny/12.png",
                "back_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/shiny/female/12.png",
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/12.png",
                "front_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/female/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/shiny/12.png",
                "front_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/shiny/female/12.png"
              }
            },
            "generation-vi": {
              "omegaruby-alphasapphire": {
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/12.png",
                "front_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/female/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/shiny/12.png",
                "front_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/shiny/female/12.png"
              },
              "x-y": {
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/12.png",
                "front_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/female/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/shiny/12.png",
                "front_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/shiny/female/12.png"
              }
            },
            "generation-vii": {
              "icons": {
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/12.png",
                "front_female": null
              },
              "ultra-sun-ultra-moon": {
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/12.png",
                "front_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/female/12.png",
                "front_shiny":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/shiny/12.png",
                "front_shiny_female":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/shiny/female/12.png"
              }
            },
            "generation-viii": {
              "icons": {
                "front_default":
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-viii/icons/12.png",
                "front_female": null
              }
            }
          }
        },
        'types': [],
        'stats': [],
        'moves': [],
      };

      when(() => mockDio.get('${PokeApiEndpoints.pokemon}1/')).thenAnswer(
        (_) async => Response(
          data: mockData,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await datasource.getPokemonById(1);

      expect(result, isA<Pokemon>());
      expect(result.id, 1);
    });
  });
}
