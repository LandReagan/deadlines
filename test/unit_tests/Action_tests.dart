import 'package:flutter_test/flutter_test.dart';

import 'package:deadlines/objects/Action.dart';

void main() {

  group('Default Action class', ()
  {
    Action action;

    setUp(() {
      action = Action(null);
    });

    test('Action class exists', () {
      expect(action, isNotNull);
      expect(action, isInstanceOf<Action>());
    });

    test('Action class has a deadline', () {
      expect(action.deadline, isNull);
    });
  });

  group('Action constructor', () {
    Action action;

    group('with deadline only', () {
      action = Action(DateTime(1978, 11, 15)); // <= loooong time back!

      test('Deadline value', () {
        expect(action.deadline, DateTime(1978, 11, 15));
      });

      test('Due State', () {
        expect(action.dueState, DUE_STATE.RED);
      });

      test('Progress State', () {
        expect(action.progressState, PROGRESS_STATE.TODO);
      });
    });

  });
}