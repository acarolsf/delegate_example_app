
import 'package:delegate_example_app/home/home_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test increment function', () {
    HomeViewDelegate viewDelegate = ViewMock();
    HomePresenter presenter = HomePresenter(viewDelegate);

    int value = 0;
    presenter.increment(value);
  });

  test('test decrement function', () {
    HomeViewDelegate viewDelegate = ViewMock();
    HomePresenter presenter = HomePresenter(viewDelegate);

    int value = 2;
    presenter.decrement(value);
  });
}

class ViewMock implements HomeViewDelegate {
  @override
  void counter(int value) {
    expect(value, 1);
  }
}
