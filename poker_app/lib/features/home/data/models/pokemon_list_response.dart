// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonListItem> results;

  PokemonListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonListResponse.fromMap(Map<String, dynamic> json) =>
      PokemonListResponse(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: List<PokemonListItem>.from(
          json['results'].map((x) => PokemonListItem.fromMap(x)),
        ),
      );

  PokemonListResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonListItem>? results,
  }) {
    return PokemonListResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}

class PokemonListItem {
  final String name;
  final String url;

  PokemonListItem({required this.name, required this.url});

  factory PokemonListItem.fromMap(Map<String, dynamic> json) =>
      PokemonListItem(
        name: json['name'],
        url: json['url'],
      );

  PokemonListItem copyWith({
    String? name,
    String? url,
  }) {
    return PokemonListItem(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
