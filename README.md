# Poker App 🧠🔥

Aplicativo Flutter de Pokédex com integração à [PokeAPI](https://pokeapi.co/), arquitetura modular (Clean Architecture), navegação com Flutter Modular e gerenciamento de estado com Cubit (Bloc). Também utiliza Firebase Analytics para monitoramento de navegação e comportamento do usuário.

---

## 🧱 Tecnologias Utilizadas

- **Flutter**
- **Dart**
- **Flutter Modular** – Navegação e Injeção de Dependência
- **Cubit (Bloc)** – Gerenciamento de estado
- **Dio** – Requisições HTTP
- **SQLite + flutter_secure_storage** – Armazenamento local seguro
- **Firebase Analytics** – Telemetria e análise
- **Google Maps + ViaCEP** – Localização de contatos
- **Intl** – Internacionalização com JSON
- **Shimmer, Hero, CachedNetworkImage** – UI aprimorada

---

## 🚀 Funcionalidades

- 📋 **Listagem de Pokémons** com paginação e scroll infinito  
- 🔍 **Busca por nome e filtros por tipo/habilidade**  
- 📄 **Tela de detalhes** com imagem, habilidades e status do Pokémon  
- 👤 **Autenticação local (SQLite + Secure Storage)**  
- 🗺️ **Módulo de contatos com mapa e busca de endereço (ViaCEP)**  
- 🌍 **Suporte a múltiplos idiomas (pt, en, es)**  
- 📊 **Firebase Analytics** para rastrear navegação e uso

---

## 🧪 Testes

O projeto conta com testes de:

- ✅ Models
- ✅ Cubits
- ✅ Datasources
- ✅ Repositories
- ✅ Widgets (Pages e componentes reutilizáveis)

---

## 📦 Instalação

### Pré-requisitos

- Flutter 3.13+
- Dart SDK 3.0+
- Android Studio / Xcode (para build mobile)
- Firebase configurado para Android e iOS

### Passos

```bash
git clone https://github.com/seu-usuario/poker_app.git
cd poker_app
flutter pub get
