
// it can be both abstract class or a mixin, but 
// abstract class is about what it is, it's a type
// and mixin is about what it does, just share a similar implementation
mixin HomeViewDelegate {
  void counter(int value);
}

class HomePresenter {
  HomePresenter(this._viewDelegate);

  final HomeViewDelegate? _viewDelegate;

  void increment(int value) {
    value++;
    _viewDelegate?.counter(value);
  }

  void decrement(int value) {
    value--;
    _viewDelegate?.counter(value);
  }
}