import 'package:flutter_app/core/request/outlet_request_param.dart';
import 'package:flutter_app/core/usecases/outlets_usecase.dart';
import 'package:flutter_app/models/index.dart';
import 'package:rxdart/rxdart.dart';

class OutletsViewModel {
  OutletsUseCase _useCase;
  static const int STATE_IDLE = 0;
  static const int STATE_LOADING = 1;

  BehaviorSubject<int> _currentState = BehaviorSubject();
  BehaviorSubject<List<Outlets>> _listOutlets = BehaviorSubject();

  Stream<int> get currentState => _currentState.stream;

  Stream<List<Outlets>> get listOutlets => _listOutlets.stream;

  OutletsViewModel() {
    this._useCase = new OutletsUseCase();
  }

  void dispose() {
    _currentState.close();
    _listOutlets.close();
  }

  Future<void> doSetupData() async {
    await Future.delayed(Duration(milliseconds: 250));
    _currentState.sink.add(STATE_LOADING);

    var param = OutletRequestParam()
      ..page = 1
      ..itemsPerPage = 100;

    await _useCase.doGetOutlets(param).then(
      (value) {
        print("element : ${value.length}");
        _listOutlets.sink.add(value);

        Future.delayed(Duration(milliseconds: 500));
        _currentState.sink.add(STATE_IDLE);
      },
    );
  }
}
