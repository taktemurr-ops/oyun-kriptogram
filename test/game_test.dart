import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kriptogram/oyun_kriptogram.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kriptogramConfig.title.length, 33);
    expect(kriptogramConfig.tagline.length, 33);
    for (final s in kriptogramConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kriptogramConfig.gameId, kriptogramId);
    expect(kriptogramRules.gameId, kriptogramId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kriptogramRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kriptogramId, optionalMechanics: kriptogramRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kriptogramRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kriptogramRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
