class BaseUiState<T> {
  /// Holds error is state is [State.ERROR]
  dynamic error;

  /// Holds data is state is [State.COMPLETED]
  T? data;

  /// Holds current [State]
  UiState? _state;

  BaseUiState();

  /// Returns [BaseUiState] with [State.LOADING]
  BaseUiState.loading() : this._state = UiState.LOADING;

  /// Returns [BaseUiState] with [State.COMPLETED]
  BaseUiState.completed({this.data}) : this._state = UiState.COMPLETED;

  /// Returns [BaseUiState] with [State.ERROR]
  BaseUiState.error(this.error) : this._state = UiState.ERROR;

  /// Returns true if the current [state] is [State.LOADING]
  bool isLoading() => this._state == UiState.LOADING;

  /// Returns true if the current [state] is [State.COMPLETED]
  bool isCompleted() => this._state == UiState.COMPLETED;

  /// Returns true if the current [state] is [State.ERROR]
  bool isError() => this._state == null || this._state == UiState.ERROR;


  @override
  String toString() {
    return 'State is $_state';
  }
}


/// UI States
enum UiState { LOADING, COMPLETED, ERROR }