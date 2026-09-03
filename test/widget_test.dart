import 'package:flutter_test/flutter_test.dart';
import 'package:jogodaforca/main.dart';

void main() {
  testWidgets('Jogo da forca inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Jogo da Forca'), findsOneWidget);
    expect(find.text('Tentativas restantes: 6'), findsOneWidget);
    expect(find.text('Nova partida'), findsOneWidget);
  });
}
