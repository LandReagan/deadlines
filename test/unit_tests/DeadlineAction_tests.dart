import 'package:flutter_test/flutter_test.dart';

import 'package:deadlines/objects/DeadlineAction.dart';

void main() {

  group('Default DeadlineAction class', ()
  {
    DeadlineAction action;

    setUp(() {
      action = DeadlineAction(null, null);
    });

    test('Action class exists', () {
      expect(action, isNotNull);
      expect(action, isInstanceOf<DeadlineAction>());
    });

    test('Action class has a deadline', () {
      expect(action.deadline, isNull);
    });
  });

  group('Action constructor', () {
    DeadlineAction action;

    group('with deadline only', () {
      action = DeadlineAction('Dummy Action', DateTime(1978, 11, 15)); // <= loooong time back!

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