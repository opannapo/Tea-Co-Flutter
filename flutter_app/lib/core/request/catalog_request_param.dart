class CatalogRequestParam {
  int page;
  int itemsPerPage;
  String orderByField;
  String orderByDirection;
  int outletId;

  Map buildJson() => <String, dynamic>{
        "page": this.page,
        "items_per_page": this.itemsPerPage,
        "order_by_field": this.orderByField,
        "order_by_direction": this.orderByDirection,
        "outlet_id": this.outletId,
      };

  @override
  String toString() {
    return 'CatalogRequestParam{page: $page, itemsPerPage: $itemsPerPage, orderByField: $orderByField, orderByDirection: $orderByDirection, outletId: $outletId}';
  }
}
