/// Due state of an action. Amber state depends on amber period, defined in Action class.
enum DUE_STATE {GREEN, AMBER, RED}
/// Taken state used to know if an action has been taken by a user.
enum TAKEN_STATE {FREE, TAKEN}
/// Progress of an Action.
enum PROGRESS_STATE {TODO, IN_PROG, DONE}

/// Fully describe an action, using enums above.
class DeadlineAction {

  final String _description;
  final DateTime _deadline;
  Duration _amberDuration;
  PROGRESS_STATE _progressState;
  TAKEN_STATE _takenState;

  /// Constructor is the preferred way of defining an action's attributes.
  DeadlineAction(
      this._description, this._deadline,
      {
        Duration amberDuration = Duration.zero,
        PROGRESS_STATE progressState = PROGRESS_STATE.TODO,
        TAKEN_STATE takenState = TAKEN_STATE.FREE
      }) :
        _amberDuration = amberDuration,
        _progressState = progressState;

  String get description => _description;
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
  TAKEN_STATE get takenState => _takenState;

  // SETTERS___________________________________________________________________


  @override
  String toString() {
    return _description ?? 'NO DESCRIPTION' + ' | ';
  }
}