import 'package:flutter_app/models/index.dart';

abstract class OutletsItemClickListener {
  void onClick(Outlets data);
}

abstract class CatalogItemClickListener {
  void onClick(Catalog data);
}
