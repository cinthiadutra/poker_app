enum PokemonType {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  stellar,
  unknown,
}

extension PokemonTypeExtension on PokemonType {
  String get translatedName {
    switch (this) {
      case PokemonType.normal:
        return 'Normal';
      case PokemonType.fighting:
        return 'Lutador';
      case PokemonType.flying:
        return 'Voador';
      case PokemonType.poison:
        return 'Venenoso';
      case PokemonType.ground:
        return 'Terrestre';
      case PokemonType.rock:
        return 'Rocha';
      case PokemonType.bug:
        return 'Inseto';
      case PokemonType.ghost:
        return 'Fantasma';
      case PokemonType.steel:
        return 'Metálico';
      case PokemonType.fire:
        return 'Fogo';
      case PokemonType.water:
        return 'Água';
      case PokemonType.grass:
        return 'Planta';
      case PokemonType.electric:
        return 'Elétrico';
      case PokemonType.psychic:
        return 'Psíquico';
      case PokemonType.ice:
        return 'Gelo';
      case PokemonType.dragon:
        return 'Dragão';
      case PokemonType.dark:
        return 'Sombrio';
      case PokemonType.fairy:
        return 'Fada';
      case PokemonType.stellar:
        return 'Estelar';
      case PokemonType.unknown:
        return 'Desconhecido';
    }
  }

  static PokemonType fromName(String name) {
    switch (name.toLowerCase()) {
      case 'normal':
        return PokemonType.normal;
      case 'fighting':
        return PokemonType.fighting;
      case 'flying':
        return PokemonType.flying;
      case 'poison':
        return PokemonType.poison;
      case 'ground':
        return PokemonType.ground;
      case 'rock':
        return PokemonType.rock;
      case 'bug':
        return PokemonType.bug;
      case 'ghost':
        return PokemonType.ghost;
      case 'steel':
        return PokemonType.steel;
      case 'fire':
        return PokemonType.fire;
      case 'water':
        return PokemonType.water;
      case 'grass':
        return PokemonType.grass;
      case 'electric':
        return PokemonType.electric;
      case 'psychic':
        return PokemonType.psychic;
      case 'ice':
        return PokemonType.ice;
      case 'dragon':
        return PokemonType.dragon;
      case 'dark':
        return PokemonType.dark;
      case 'fairy':
        return PokemonType.fairy;
      case 'stellar':
        return PokemonType.stellar;
      default:
        return PokemonType.unknown;
    }
  }
}

enum PokemonAbility {
  stench('stench', 'Cheiro Ruim'),
  drizzle('drizzle', 'Chuva'),
  speedBoost('speed-boost', 'Aumento de Velocidade'),
  battleArmor('battle-armor', 'Armadura de Batalha'),
  sturdy('sturdy', 'Robustez'),
  damp('damp', 'Úmido'),
  limber('limber', 'Flexível'),
  sandVeil('sand-veil', 'Véu de Areia'),
  static_('static', 'Estático'),
  voltAbsorb('volt-absorb', 'Absorção de Volts'),
  waterAbsorb('water-absorb', 'Absorção de Água'),
  oblivious('oblivious', 'Desatento'),
  cloudNine('cloud-nine', 'Clima Nulo'),
  compoundEyes('compound-eyes', 'Olhos Compostos'),
  insomnia('insomnia', 'Insônia'),
  colorChange('color-change', 'Mudança de Cor'),
  immunity('immunity', 'Imunidade'),
  flashFire('flash-fire', 'Fogo Fátuo'),
  shieldDust('shield-dust', 'Escudo de Poeira'),
  ownTempo('own-tempo', 'Ritmo Próprio'),
  unknown('unknown', '-');

  final String name;
  final String translated;

  const PokemonAbility(this.name, this.translated);

  static String translate(String name) {
    return PokemonAbility.values
        .firstWhere(
          (e) => e.name == name,
          orElse: () => PokemonAbility.unknown,
        )
        .translated;
  }
}
