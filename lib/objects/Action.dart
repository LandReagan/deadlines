/// Due state of an action. Amber state depends on amber period, defined in Action class.
enum DUE_STATE {GREEN, AMBER, RED}
/// Taken state used to know if an action has been taken by a user.
enum TAKEN_STATE {FREE, TAKEN}
/// Progress of an Action.
enum PROGRESS_STATE {TODO, IN_PROG, DONE}

/// Fully describe an action, using enums above.
class Action {

  final DateTime _deadline;
  Duration _amberDuration;
  PROGRESS_STATE _progressState;

  /// Constructor is the preferred way of defining an action's attributes.
  Action(
      this._deadline,
      {
        Duration amberDuration = Duration.zero,
        PROGRESS_STATE progressState = PROGRESS_STATE.TODO,
      }) :
        _amberDuration = amberDuration,
        _progressState = progressState;

  DateTime get deadline => _deadline;
  /// Due state is calculated on getting it.
  DUE_STATE get dueState {
    if (DateTime.now().toUtc().isAfter(_deadline)) {
      return DUE_STATE.RED;
    } else if (DateTime.now().toUtc().isAfter(_deadline.subtract(_amberDuration))) {
      return DUE_STATE.AMBER;
    } else {
      return DUE_STATE.GREEN;
    }
  }
  PROGRESS_STATE get progressState => _progressState;
}