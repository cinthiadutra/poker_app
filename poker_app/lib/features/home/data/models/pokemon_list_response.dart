import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  factory PokemonListResponse.fromJson(String source) =>
      PokemonListResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'PokemonListResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(covariant PokemonListResponse other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}

class PokemonListItem {
  final String name;
  final String url;

  PokemonListItem({required this.name, required this.url});

  factory PokemonListItem.fromMap(Map<String, dynamic> json) => PokemonListItem(
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());

  factory PokemonListItem.fromJson(String source) =>
      PokemonListItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonListItem(name: $name, url: $url)';
}
