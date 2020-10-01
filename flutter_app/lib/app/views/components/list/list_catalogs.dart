import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/app/utils/constant.dart' as Constants;
import 'package:flutter_app/models/catalog.dart';

import '../UIText.dart';
import 'click_listener.dart';

class ListCatalogItem {
  static Widget content(
      Catalog entity, CatalogItemClickListener clickListener) {
    return Card(
      margin: EdgeInsets.fromLTRB(25, 5, 25, 20),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      color: Constants.Colors.TEXT_BLACK,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.base(
                    isBold: true,
                    size: 16,
                    color: Constants.Colors.GOLD_1,
                    text: entity.product_name,
                  ),
                  Divider(height: 10, color: Colors.transparent),
                  UIText.base(
                    isBold: false,
                    size: 12,
                    color: Constants.Colors.WHITE_GRAY_SOFT,
                    text: entity.product_name,
                  ),
                ],
              ),
            ),
            Divider(height: 10, color: Colors.transparent),
            Container(
              color: Constants.Colors.BASE,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              entity.is_bundle
                                  ? Icons.timer_off
                                  : Icons.access_time,
                              size: 14,
                              color: entity.is_bundle
                                  ? Constants.Colors.TEXT_BLACK_SOFT
                                  : Colors.green,
                            ),
                            UIText.base(
                              isBold: false,
                              size: 14,
                              color: entity.is_bundle
                                  ? Constants.Colors.TEXT_BLACK_SOFT
                                  : Colors.green,
                              text: entity.is_bundle ? ' CLOSE' : ' OPEN',
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 14,
                              color: entity.is_bundle
                                  ? Colors.green
                                  : Constants.Colors.TEXT_BLACK_SOFT,
                            ),
                            UIText.base(
                              isBold: false,
                              size: 14,
                              color: entity.is_bundle
                                  ? Colors.green
                                  : Constants.Colors.TEXT_BLACK_SOFT,
                              text: entity.is_bundle ? ' ACTIVE' : ' INACTIVE',
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.directions_car,
                              size: 14,
                              color: entity.is_bundle
                                  ? Colors.green
                                  : Constants.Colors.TEXT_BLACK_SOFT,
                            ),
                            UIText.base(
                              isBold: false,
                              size: 14,
                              color: entity.is_bundle
                                  ? Colors.green
                                  : Constants.Colors.TEXT_BLACK_SOFT,
                              text: ' DELIVERY',
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.business_center,
                              size: 14,
                              color: entity.is_bundle
                                  ? Colors.green
                                  : Constants.Colors.TEXT_BLACK_SOFT,
                            ),
                            UIText.base(
                              isBold: false,
                              size: 14,
                              color: entity.is_bundle
                                  ? Colors.green
                                  : Constants.Colors.TEXT_BLACK_SOFT,
                              text: ' PICKUP',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
