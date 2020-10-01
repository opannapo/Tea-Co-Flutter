import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/app/utils/constant.dart' as Constants;
import 'package:flutter_app/models/catalog.dart';

import '../UIText.dart';
import 'click_listener.dart';

class ListCatalogGridItem {
  static Widget content(
      Catalog entity, CatalogItemClickListener clickListener) {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      color: Constants.Colors.TEXT_BLACK,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: GestureDetector(
        onTap: () => clickListener.onClick(entity),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Constants.Colors.BASE,
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(entity.photo_1_url),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Constants.Colors.BASE,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(1)],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIText.base(
                        isBold: true,
                        size: 14,
                        color: Constants.Colors.GOLD_1,
                        text: entity.brand_name,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
