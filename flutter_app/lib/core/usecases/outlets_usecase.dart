import 'package:flutter_app/core/request/outlet_request_param.dart';
import 'package:flutter_app/core/service/outlet_services.dart';
import 'package:flutter_app/models/index.dart';

class OutletsUseCase {
  OutletServices service = new OutletServices();

  Future<List<Outlets>> doGetOutlets(OutletRequestParam requestParam) async {
    return await service.getOutlets(requestParam);
  }
}
