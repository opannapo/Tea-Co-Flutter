import 'package:flutter_app/core/request/catalog_request_param.dart';
import 'package:flutter_app/core/usecases/outlet_usecase.dart';
import 'package:flutter_app/models/index.dart';
import 'package:rxdart/rxdart.dart';

class OutletViewModel {
  OutletUseCase _useCase;
  static const int STATE_IDLE = 0;
  static const int STATE_LOADING = 1;

  BehaviorSubject<int> _currentState = BehaviorSubject();
  BehaviorSubject<List<Catalog>> _listContent = BehaviorSubject();

  Stream<int> get currentState => _currentState.stream;

  Stream<List<Catalog>> get listContent => _listContent.stream;

  OutletViewModel() {
    this._useCase = new OutletUseCase();
  }

  void dispose() {
    _currentState.close();
    _listContent.close();
  }

  Future<void> doSetupDataCatalog(int outletId) async {
    await Future.delayed(Duration(milliseconds: 250));
    _currentState.sink.add(STATE_LOADING);

    var param = CatalogRequestParam()
      ..page = 1
      ..itemsPerPage = 100
      ..outletId = outletId;

    await _useCase.doGetCatalog(param).then(
      (value) {
        print("element : ${value.length}");
        _listContent.sink.add(value);

        Future.delayed(Duration(milliseconds: 500));
        _currentState.sink.add(STATE_IDLE);
      },
    );
  }
}
