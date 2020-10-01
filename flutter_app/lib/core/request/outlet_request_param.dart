class OutletRequestParam {
  int page;
  int itemsPerPage;
  String orderByField;
  String orderByDirection;

  Map buildJson() => <String, dynamic>{
        "page": this.page,
        "items_per_page": this.itemsPerPage,
        "order_by_field": this.orderByField,
        "order_by_direction": this.orderByDirection,
      };

  @override
  String toString() {
    return 'OutletRequestParam{page: $page, itemsPerPage: $itemsPerPage, orderByField: $orderByField, orderByDirection: $orderByDirection}';
  }
}
