// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pokemon {
    final List<Ability>? abilities;
    final int? baseExperience;
    final Cries? cries;
    final List<Species>? forms;
    final List<GameIndex>? gameIndices;
    final int? height;
    final List<dynamic>? heldItems;
    final int? id;
    final bool? isDefault;
    final String? locationAreaEncounters;
    final List<Move>? moves;
    final String? name;
    final int? order;
    final List<dynamic>? pastAbilities;
    final List<dynamic>? pastTypes;
    final Species? species;
    final Sprites? sprites;
    final List<Stat>? stats;
    final List<Type>? types;
    final int? weight;

    Pokemon({
        this.abilities,
        this.baseExperience,
        this.cries,
        this.forms,
        this.gameIndices,
        this.height,
        this.heldItems,
        this.id,
        this.isDefault,
        this.locationAreaEncounters,
        this.moves,
        this.name,
        this.order,
        this.pastAbilities,
        this.pastTypes,
        this.species,
        this.sprites,
        this.stats,
        this.types,
        this.weight,
    });

    Pokemon copyWith({
        List<Ability>? abilities,
        int? baseExperience,
        Cries? cries,
        List<Species>? forms,
        List<GameIndex>? gameIndices,
        int? height,
        List<dynamic>? heldItems,
        int? id,
        bool? isDefault,
        String? locationAreaEncounters,
        List<Move>? moves,
        String? name,
        int? order,
        List<dynamic>? pastAbilities,
        List<dynamic>? pastTypes,
        Species? species,
        Sprites? sprites,
        List<Stat>? stats,
        List<Type>? types,
        int? weight,
    }) => 
        Pokemon(
            abilities: abilities ?? this.abilities,
            baseExperience: baseExperience ?? this.baseExperience,
            cries: cries ?? this.cries,
            forms: forms ?? this.forms,
            gameIndices: gameIndices ?? this.gameIndices,
            height: height ?? this.height,
            heldItems: heldItems ?? this.heldItems,
            id: id ?? this.id,
            isDefault: isDefault ?? this.isDefault,
            locationAreaEncounters: locationAreaEncounters ?? this.locationAreaEncounters,
            moves: moves ?? this.moves,
            name: name ?? this.name,
            order: order ?? this.order,
            pastAbilities: pastAbilities ?? this.pastAbilities,
            pastTypes: pastTypes ?? this.pastTypes,
            species: species ?? this.species,
            sprites: sprites ?? this.sprites,
            stats: stats ?? this.stats,
            types: types ?? this.types,
            weight: weight ?? this.weight,
        );

    factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromMap(x))),
        baseExperience: json["base_experience"],
        cries: json["cries"] == null ? null : Cries.fromMap(json["cries"]),
        forms: json["forms"] == null ? [] : List<Species>.from(json["forms"]!.map((x) => Species.fromMap(x))),
        gameIndices: json["game_indices"] == null ? [] : List<GameIndex>.from(json["game_indices"]!.map((x) => GameIndex.fromMap(x))),
        height: json["height"],
        heldItems: json["held_items"] == null ? [] : List<dynamic>.from(json["held_items"]!.map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: json["moves"] == null ? [] : List<Move>.from(json["moves"]!.map((x) => Move.fromMap(x))),
        name: json["name"],
        order: json["order"],
        pastAbilities: json["past_abilities"] == null ? [] : List<dynamic>.from(json["past_abilities"]!.map((x) => x)),
        pastTypes: json["past_types"] == null ? [] : List<dynamic>.from(json["past_types"]!.map((x) => x)),
        species: json["species"] == null ? null : Species.fromMap(json["species"]),
        sprites: json["sprites"] == null ? null : Sprites.fromMap(json["sprites"]),
        stats: json["stats"] == null ? [] : List<Stat>.from(json["stats"]!.map((x) => Stat.fromMap(x))),
        types: json["types"] == null ? [] : List<Type>.from(json["types"]!.map((x) => Type.fromMap(x))),
        weight: json["weight"],
    );

    Map<String, dynamic> toMap() => {
        "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toMap())),
        "base_experience": baseExperience,
        "cries": cries?.toMap(),
        "forms": forms == null ? [] : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "game_indices": gameIndices == null ? [] : List<dynamic>.from(gameIndices!.map((x) => x.toMap())),
        "height": height,
        "held_items": heldItems == null ? [] : List<dynamic>.from(heldItems!.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": moves == null ? [] : List<dynamic>.from(moves!.map((x) => x.toMap())),
        "name": name,
        "order": order,
        "past_abilities": pastAbilities == null ? [] : List<dynamic>.from(pastAbilities!.map((x) => x)),
        "past_types": pastTypes == null ? [] : List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species?.toMap(),
        "sprites": sprites?.toMap(),
        "stats": stats == null ? [] : List<dynamic>.from(stats!.map((x) => x.toMap())),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x.toMap())),
        "weight": weight,
    };
}

class Ability {
    final Species? ability;
    final bool? isHidden;
    final int? slot;

    Ability({
        this.ability,
        this.isHidden,
        this.slot,
    });

    Ability copyWith({
        Species? ability,
        bool? isHidden,
        int? slot,
    }) => 
        Ability(
            ability: ability ?? this.ability,
            isHidden: isHidden ?? this.isHidden,
            slot: slot ?? this.slot,
        );

    factory Ability.fromJson(String str) => Ability.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability: json["ability"] == null ? null : Species.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );

    Map<String, dynamic> toMap() => {
        "ability": ability?.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
    };
}

class Species {
    final String? name;
    final String? url;

    Species({
        this.name,
        this.url,
    });

    Species copyWith({
        String? name,
        String? url,
    }) => 
        Species(
            name: name ?? this.name,
            url: url ?? this.url,
        );

    factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class Cries {
    final String? latest;
    final String? legacy;

    Cries({
        this.latest,
        this.legacy,
    });

    Cries copyWith({
        String? latest,
        String? legacy,
    }) => 
        Cries(
            latest: latest ?? this.latest,
            legacy: legacy ?? this.legacy,
        );

    factory Cries.fromJson(String str) => Cries.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cries.fromMap(Map<String, dynamic> json) => Cries(
        latest: json["latest"],
        legacy: json["legacy"],
    );

    Map<String, dynamic> toMap() => {
        "latest": latest,
        "legacy": legacy,
    };
}

class GameIndex {
    final int? gameIndex;
    final Species? version;

    GameIndex({
        this.gameIndex,
        this.version,
    });

    GameIndex copyWith({
        int? gameIndex,
        Species? version,
    }) => 
        GameIndex(
            gameIndex: gameIndex ?? this.gameIndex,
            version: version ?? this.version,
        );

    factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: json["version"] == null ? null : Species.fromMap(json["version"]),
    );

    Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version?.toMap(),
    };
}

class Move {
    final Species? move;
    final List<VersionGroupDetail>? versionGroupDetails;

    Move({
        this.move,
        this.versionGroupDetails,
    });

    Move copyWith({
        Species? move,
        List<VersionGroupDetail>? versionGroupDetails,
    }) => 
        Move(
            move: move ?? this.move,
            versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
        );

    factory Move.fromJson(String str) => Move.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: json["move"] == null ? null : Species.fromMap(json["move"]),
        versionGroupDetails: json["version_group_details"] == null ? [] : List<VersionGroupDetail>.from(json["version_group_details"]!.map((x) => VersionGroupDetail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "move": move?.toMap(),
        "version_group_details": versionGroupDetails == null ? [] : List<dynamic>.from(versionGroupDetails!.map((x) => x.toMap())),
    };
}

class VersionGroupDetail {
    final int? levelLearnedAt;
    final Species? moveLearnMethod;
    final int? order;
    final Species? versionGroup;

    VersionGroupDetail({
        this.levelLearnedAt,
        this.moveLearnMethod,
        this.order,
        this.versionGroup,
    });

    VersionGroupDetail copyWith({
        int? levelLearnedAt,
        Species? moveLearnMethod,
        int? order,
        Species? versionGroup,
    }) => 
        VersionGroupDetail(
            levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
            moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
            order: order ?? this.order,
            versionGroup: versionGroup ?? this.versionGroup,
        );

    factory VersionGroupDetail.fromJson(String str) => VersionGroupDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VersionGroupDetail.fromMap(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: json["move_learn_method"] == null ? null : Species.fromMap(json["move_learn_method"]),
        order: json["order"],
        versionGroup: json["version_group"] == null ? null : Species.fromMap(json["version_group"]),
    );

    Map<String, dynamic> toMap() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod?.toMap(),
        "order": order,
        "version_group": versionGroup?.toMap(),
    };
}

class GenerationV {
    final Sprites? blackWhite;

    GenerationV({
        this.blackWhite,
    });

    GenerationV copyWith({
        Sprites? blackWhite,
    }) => 
        GenerationV(
            blackWhite: blackWhite ?? this.blackWhite,
        );

    factory GenerationV.fromJson(String str) => GenerationV.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        blackWhite: json["black-white"] == null ? null : Sprites.fromMap(json["black-white"]),
    );

    Map<String, dynamic> toMap() => {
        "black-white": blackWhite?.toMap(),
    };
}

class GenerationIv {
    final Sprites? diamondPearl;
    final Sprites? heartgoldSoulsilver;
    final Sprites? platinum;

    GenerationIv({
        this.diamondPearl,
        this.heartgoldSoulsilver,
        this.platinum,
    });

    GenerationIv copyWith({
        Sprites? diamondPearl,
        Sprites? heartgoldSoulsilver,
        Sprites? platinum,
    }) => 
        GenerationIv(
            diamondPearl: diamondPearl ?? this.diamondPearl,
            heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
            platinum: platinum ?? this.platinum,
        );

    factory GenerationIv.fromJson(String str) => GenerationIv.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: json["diamond-pearl"] == null ? null : Sprites.fromMap(json["diamond-pearl"]),
        heartgoldSoulsilver: json["heartgold-soulsilver"] == null ? null : Sprites.fromMap(json["heartgold-soulsilver"]),
        platinum: json["platinum"] == null ? null : Sprites.fromMap(json["platinum"]),
    );

    Map<String, dynamic> toMap() => {
        "diamond-pearl": diamondPearl?.toMap(),
        "heartgold-soulsilver": heartgoldSoulsilver?.toMap(),
        "platinum": platinum?.toMap(),
    };
}

class Versions {
    final GenerationI? generationI;
    final GenerationIi? generationIi;
    final GenerationIii? generationIii;
    final GenerationIv? generationIv;
    final GenerationV? generationV;
    final Map<String, Home>? generationVi;
    final GenerationVii? generationVii;
    final GenerationViii? generationViii;

    Versions({
        this.generationI,
        this.generationIi,
        this.generationIii,
        this.generationIv,
        this.generationV,
        this.generationVi,
        this.generationVii,
        this.generationViii,
    });

    Versions copyWith({
        GenerationI? generationI,
        GenerationIi? generationIi,
        GenerationIii? generationIii,
        GenerationIv? generationIv,
        GenerationV? generationV,
        Map<String, Home>? generationVi,
        GenerationVii? generationVii,
        GenerationViii? generationViii,
    }) => 
        Versions(
            generationI: generationI ?? this.generationI,
            generationIi: generationIi ?? this.generationIi,
            generationIii: generationIii ?? this.generationIii,
            generationIv: generationIv ?? this.generationIv,
            generationV: generationV ?? this.generationV,
            generationVi: generationVi ?? this.generationVi,
            generationVii: generationVii ?? this.generationVii,
            generationViii: generationViii ?? this.generationViii,
        );

    factory Versions.fromJson(String str) => Versions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Versions.fromMap(Map<String, dynamic> json) => Versions(
        generationI: json["generation-i"] == null ? null : GenerationI.fromMap(json["generation-i"]),
        generationIi: json["generation-ii"] == null ? null : GenerationIi.fromMap(json["generation-ii"]),
        generationIii: json["generation-iii"] == null ? null : GenerationIii.fromMap(json["generation-iii"]),
        generationIv: json["generation-iv"] == null ? null : GenerationIv.fromMap(json["generation-iv"]),
        generationV: json["generation-v"] == null ? null : GenerationV.fromMap(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]!).map((k, v) => MapEntry<String, Home>(k, Home.fromMap(v))),
        generationVii: json["generation-vii"] == null ? null : GenerationVii.fromMap(json["generation-vii"]),
        generationViii: json["generation-viii"] == null ? null : GenerationViii.fromMap(json["generation-viii"]),
    );

    Map<String, dynamic> toMap() => {
        "generation-i": generationI?.toMap(),
        "generation-ii": generationIi?.toMap(),
        "generation-iii": generationIii?.toMap(),
        "generation-iv": generationIv?.toMap(),
        "generation-v": generationV?.toMap(),
        "generation-vi": Map.from(generationVi!).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "generation-vii": generationVii?.toMap(),
        "generation-viii": generationViii?.toMap(),
    };
}

class Other {
    final DreamWorld? dreamWorld;
    final Home? home;
    final OfficialArtwork? officialArtwork;
    final Sprites? showdown;

    Other({
        this.dreamWorld,
        this.home,
        this.officialArtwork,
        this.showdown,
    });

    Other copyWith({
        DreamWorld? dreamWorld,
        Home? home,
        OfficialArtwork? officialArtwork,
        Sprites? showdown,
    }) => 
        Other(
            dreamWorld: dreamWorld ?? this.dreamWorld,
            home: home ?? this.home,
            officialArtwork: officialArtwork ?? this.officialArtwork,
            showdown: showdown ?? this.showdown,
        );

    factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Other.fromMap(Map<String, dynamic> json) => Other(
        dreamWorld: json["dream_world"] == null ? null : DreamWorld.fromMap(json["dream_world"]),
        home: json["home"] == null ? null : Home.fromMap(json["home"]),
        officialArtwork: json["official-artwork"] == null ? null : OfficialArtwork.fromMap(json["official-artwork"]),
        showdown: json["showdown"] == null ? null : Sprites.fromMap(json["showdown"]),
    );

    Map<String, dynamic> toMap() => {
        "dream_world": dreamWorld?.toMap(),
        "home": home?.toMap(),
        "official-artwork": officialArtwork?.toMap(),
        "showdown": showdown?.toMap(),
    };
}

class Sprites {
    final String? backDefault;
    final String? backFemale;
    final String? backShiny;
    final String? backShinyFemale;
    final String? frontDefault;
    final String? frontFemale;
    final String? frontShiny;
    final String? frontShinyFemale;
    final Other? other;
    final Versions? versions;
    final Sprites? animated;

    Sprites({
        this.backDefault,
        this.backFemale,
        this.backShiny,
        this.backShinyFemale,
        this.frontDefault,
        this.frontFemale,
        this.frontShiny,
        this.frontShinyFemale,
        this.other,
        this.versions,
        this.animated,
    });


    factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromMap(json["other"]),
        versions: json["versions"] == null ? null : Versions.fromMap(json["versions"]),
        animated: json["animated"] == null ? null : Sprites.fromMap(json["animated"]),
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other?.toMap(),
        "versions": versions?.toMap(),
        "animated": animated?.toMap(),
    };

  Sprites copyWith({
    String? backDefault,
    String? backFemale,
    String? backShiny,
    String? backShinyFemale,
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
    String? frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) {
    return Sprites(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      other: other ?? this.other,
      versions: versions ?? this.versions,
      animated: animated ?? this.animated,
    );
  }
}

class GenerationI {
    final RedBlue? redBlue;
    final RedBlue? yellow;

    GenerationI({
        this.redBlue,
        this.yellow,
    });

    GenerationI copyWith({
        RedBlue? redBlue,
        RedBlue? yellow,
    }) => 
        GenerationI(
            redBlue: redBlue ?? this.redBlue,
            yellow: yellow ?? this.yellow,
        );

    factory GenerationI.fromJson(String str) => GenerationI.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationI.fromMap(Map<String, dynamic> json) => GenerationI(
        redBlue: json["red-blue"] == null ? null : RedBlue.fromMap(json["red-blue"]),
        yellow: json["yellow"] == null ? null : RedBlue.fromMap(json["yellow"]),
    );

    Map<String, dynamic> toMap() => {
        "red-blue": redBlue?.toMap(),
        "yellow": yellow?.toMap(),
    };
}

class RedBlue {
    final String? backDefault;
    final String? backGray;
    final String? backTransparent;
    final String? frontDefault;
    final String? frontGray;
    final String? frontTransparent;

    RedBlue({
        this.backDefault,
        this.backGray,
        this.backTransparent,
        this.frontDefault,
        this.frontGray,
        this.frontTransparent,
    });

    RedBlue copyWith({
        String? backDefault,
        String? backGray,
        String? backTransparent,
        String? frontDefault,
        String? frontGray,
        String? frontTransparent,
    }) => 
        RedBlue(
            backDefault: backDefault ?? this.backDefault,
            backGray: backGray ?? this.backGray,
            backTransparent: backTransparent ?? this.backTransparent,
            frontDefault: frontDefault ?? this.frontDefault,
            frontGray: frontGray ?? this.frontGray,
            frontTransparent: frontTransparent ?? this.frontTransparent,
        );

    factory RedBlue.fromJson(String str) => RedBlue.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RedBlue.fromMap(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
    };
}

class GenerationIi {
    final Crystal? crystal;
    final Gold? gold;
    final Gold? silver;

    GenerationIi({
        this.crystal,
        this.gold,
        this.silver,
    });

    GenerationIi copyWith({
        Crystal? crystal,
        Gold? gold,
        Gold? silver,
    }) => 
        GenerationIi(
            crystal: crystal ?? this.crystal,
            gold: gold ?? this.gold,
            silver: silver ?? this.silver,
        );

    factory GenerationIi.fromJson(String str) => GenerationIi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIi.fromMap(Map<String, dynamic> json) => GenerationIi(
        crystal: json["crystal"] == null ? null : Crystal.fromMap(json["crystal"]),
        gold: json["gold"] == null ? null : Gold.fromMap(json["gold"]),
        silver: json["silver"] == null ? null : Gold.fromMap(json["silver"]),
    );

    Map<String, dynamic> toMap() => {
        "crystal": crystal?.toMap(),
        "gold": gold?.toMap(),
        "silver": silver?.toMap(),
    };
}

class Crystal {
    final String? backDefault;
    final String? backShiny;
    final String? backShinyTransparent;
    final String? backTransparent;
    final String? frontDefault;
    final String? frontShiny;
    final String? frontShinyTransparent;
    final String? frontTransparent;

    Crystal({
        this.backDefault,
        this.backShiny,
        this.backShinyTransparent,
        this.backTransparent,
        this.frontDefault,
        this.frontShiny,
        this.frontShinyTransparent,
        this.frontTransparent,
    });

    Crystal copyWith({
        String? backDefault,
        String? backShiny,
        String? backShinyTransparent,
        String? backTransparent,
        String? frontDefault,
        String? frontShiny,
        String? frontShinyTransparent,
        String? frontTransparent,
    }) => 
        Crystal(
            backDefault: backDefault ?? this.backDefault,
            backShiny: backShiny ?? this.backShiny,
            backShinyTransparent: backShinyTransparent ?? this.backShinyTransparent,
            backTransparent: backTransparent ?? this.backTransparent,
            frontDefault: frontDefault ?? this.frontDefault,
            frontShiny: frontShiny ?? this.frontShiny,
            frontShinyTransparent: frontShinyTransparent ?? this.frontShinyTransparent,
            frontTransparent: frontTransparent ?? this.frontTransparent,
        );

    factory Crystal.fromJson(String str) => Crystal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Crystal.fromMap(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
    };
}

class Gold {
    final String? backDefault;
    final String? backShiny;
    final String? frontDefault;
    final String? frontShiny;
    final String? frontTransparent;

    Gold({
        this.backDefault,
        this.backShiny,
        this.frontDefault,
        this.frontShiny,
        this.frontTransparent,
    });

    Gold copyWith({
        String? backDefault,
        String? backShiny,
        String? frontDefault,
        String? frontShiny,
        String? frontTransparent,
    }) => 
        Gold(
            backDefault: backDefault ?? this.backDefault,
            backShiny: backShiny ?? this.backShiny,
            frontDefault: frontDefault ?? this.frontDefault,
            frontShiny: frontShiny ?? this.frontShiny,
            frontTransparent: frontTransparent ?? this.frontTransparent,
        );

    factory Gold.fromJson(String str) => Gold.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Gold.fromMap(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
    };
}

class GenerationIii {
    final OfficialArtwork? emerald;
    final Gold? fireredLeafgreen;
    final Gold? rubySapphire;

    GenerationIii({
        this.emerald,
        this.fireredLeafgreen,
        this.rubySapphire,
    });

    GenerationIii copyWith({
        OfficialArtwork? emerald,
        Gold? fireredLeafgreen,
        Gold? rubySapphire,
    }) => 
        GenerationIii(
            emerald: emerald ?? this.emerald,
            fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
            rubySapphire: rubySapphire ?? this.rubySapphire,
        );

    factory GenerationIii.fromJson(String str) => GenerationIii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIii.fromMap(Map<String, dynamic> json) => GenerationIii(
        emerald: json["emerald"] == null ? null : OfficialArtwork.fromMap(json["emerald"]),
        fireredLeafgreen: json["firered-leafgreen"] == null ? null : Gold.fromMap(json["firered-leafgreen"]),
        rubySapphire: json["ruby-sapphire"] == null ? null : Gold.fromMap(json["ruby-sapphire"]),
    );

    Map<String, dynamic> toMap() => {
        "emerald": emerald?.toMap(),
        "firered-leafgreen": fireredLeafgreen?.toMap(),
        "ruby-sapphire": rubySapphire?.toMap(),
    };
}

class OfficialArtwork {
    final String? frontDefault;
    final String? frontShiny;

    OfficialArtwork({
        this.frontDefault,
        this.frontShiny,
    });

    OfficialArtwork copyWith({
        String? frontDefault,
        String? frontShiny,
    }) => 
        OfficialArtwork(
            frontDefault: frontDefault ?? this.frontDefault,
            frontShiny: frontShiny ?? this.frontShiny,
        );

    factory OfficialArtwork.fromJson(String str) => OfficialArtwork.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class Home {
    final String? frontDefault;
    final dynamic frontFemale;
    final String? frontShiny;
    final dynamic frontShinyFemale;

    Home({
        this.frontDefault,
        this.frontFemale,
        this.frontShiny,
        this.frontShinyFemale,
    });

    Home copyWith({
        String? frontDefault,
        dynamic frontFemale,
        String? frontShiny,
        dynamic frontShinyFemale,
    }) => 
        Home(
            frontDefault: frontDefault ?? this.frontDefault,
            frontFemale: frontFemale ?? this.frontFemale,
            frontShiny: frontShiny ?? this.frontShiny,
            frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
        );

    factory Home.fromJson(String str) => Home.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Home.fromMap(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
    };
}

class GenerationVii {
    final DreamWorld? icons;
    final Home? ultraSunUltraMoon;

    GenerationVii({
        this.icons,
        this.ultraSunUltraMoon,
    });

    GenerationVii copyWith({
        DreamWorld? icons,
        Home? ultraSunUltraMoon,
    }) => 
        GenerationVii(
            icons: icons ?? this.icons,
            ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
        );

    factory GenerationVii.fromJson(String str) => GenerationVii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
        icons: json["icons"] == null ? null : DreamWorld.fromMap(json["icons"]),
        ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null ? null : Home.fromMap(json["ultra-sun-ultra-moon"]),
    );

    Map<String, dynamic> toMap() => {
        "icons": icons?.toMap(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon?.toMap(),
    };
}

class DreamWorld {
    final String? frontDefault;
    final dynamic frontFemale;

    DreamWorld({
        this.frontDefault,
        this.frontFemale,
    });

    DreamWorld copyWith({
        String? frontDefault,
        dynamic frontFemale,
    }) => 
        DreamWorld(
            frontDefault: frontDefault ?? this.frontDefault,
            frontFemale: frontFemale ?? this.frontFemale,
        );

    factory DreamWorld.fromJson(String str) => DreamWorld.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
    };
}

class GenerationViii {
    final DreamWorld? icons;

    GenerationViii({
        this.icons,
    });

    GenerationViii copyWith({
        DreamWorld? icons,
    }) => 
        GenerationViii(
            icons: icons ?? this.icons,
        );

    factory GenerationViii.fromJson(String str) => GenerationViii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
        icons: json["icons"] == null ? null : DreamWorld.fromMap(json["icons"]),
    );

    Map<String, dynamic> toMap() => {
        "icons": icons?.toMap(),
    };
}

class Stat {
    final int? baseStat;
    final int? effort;
    final Species? stat;

    Stat({
        this.baseStat,
        this.effort,
        this.stat,
    });

    Stat copyWith({
        int? baseStat,
        int? effort,
        Species? stat,
    }) => 
        Stat(
            baseStat: baseStat ?? this.baseStat,
            effort: effort ?? this.effort,
            stat: stat ?? this.stat,
        );

    factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null ? null : Species.fromMap(json["stat"]),
    );

    Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toMap(),
    };
}

class Type {
    final int? slot;
    final Species? type;

    Type({
        this.slot,
        this.type,
    });

    Type copyWith({
        int? slot,
        Species? type,
    }) => 
        Type(
            slot: slot ?? this.slot,
            type: type ?? this.type,
        );

    factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: json["type"] == null ? null : Species.fromMap(json["type"]),
    );

    Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type?.toMap(),
    };
}
