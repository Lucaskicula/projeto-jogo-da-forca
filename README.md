# Jogo da Forca

O aplicativo apresenta um jogo da forca simples. A cada partida, uma palavra é sorteada e o jogador deve descobrir escolhendo uma letra por vez antes que suas tentativas acabem.

## Funcionalidades

- Sorteio aleatório de palavras.
- Teclado de letras customizado.
- Bloqueio de letras já utilizadas.
- Exibição das letras corretas nas respectivas posições.
- Contador de tentativas restantes.
- Construção progressiva do boneco conforme os erros.
- Detecção automática de vitória ou derrota.
- Histórico das partidas finalizadas.
- Botão para iniciar uma nova partida.

## Estrutura do projeto

O código principal está organizado dentro da pasta `lib`:

```text
lib/
├── main.dart
├── pages/
│   ├── forca_page.dart
│   └── history_page.dart
└── widgets/
    ├── hangman_widget.dart
    └── letter_button_widget.dart
```

O projeto utiliza uma estrutura simples, com `StatefulWidget`, `setState`, listas, funções e navegação por meio do `Navigator.push`.

## Como executar

Tenha o Flutter instalado e execute os comandos abaixo na pasta do projeto:

```bash
flutter pub get
flutter run
```

## Desenvolvido por Lucas Kiçula.
