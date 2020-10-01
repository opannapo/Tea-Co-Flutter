import 'package:flutter_app/core/request/catalog_request_param.dart';
import 'package:flutter_app/core/usecases/catalog_usecase.dart';
import 'package:flutter_app/models/index.dart';
import 'package:rxdart/rxdart.dart';

class CatalogsViewModel {
  CatalogUseCase _useCase;
  static const int STATE_IDLE = 0;
  static const int STATE_LOADING = 1;

  BehaviorSubject<int> _currentState = BehaviorSubject();
  BehaviorSubject<List<Catalog>> _listContent = BehaviorSubject();

  Stream<int> get currentState => _currentState.stream;

  Stream<List<Catalog>> get listContent => _listContent.stream;

  CatalogsViewModel() {
    this._useCase = new CatalogUseCase();
  }

  void dispose() {
    _currentState.close();
    _listContent.close();
  }

  Future<void> doSetupData() async {
    await Future.delayed(Duration(milliseconds: 250));
    _currentState.sink.add(STATE_LOADING);

    var param = CatalogRequestParam()
      ..page = 1
      ..itemsPerPage = 100
      ..outletId = 1;

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
