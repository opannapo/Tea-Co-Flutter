import 'package:flutter_app/core/request/catalog_request_param.dart';
import 'package:flutter_app/core/service/catalog_services.dart';
import 'package:flutter_app/models/index.dart';

class CatalogUseCase {
  CatalogServices service = new CatalogServices();

  Future<List<Catalog>> doGetCatalog(CatalogRequestParam requestParam) async {
    return await service.getCatalog(requestParam);
  }
}
