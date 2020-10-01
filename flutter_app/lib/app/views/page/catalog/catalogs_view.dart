import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/app/utils/constant.dart' as Constants;
import 'package:flutter_app/app/utils/extensions.dart';
import 'package:flutter_app/app/views/components/UIText.dart';
import 'package:flutter_app/models/index.dart';

class CatalogsView extends StatefulWidget {
  final Catalog entity;
  final String heroTag;

  const CatalogsView(this.entity, this.heroTag, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CatalogsViewState();
}

class CatalogsViewState extends State<CatalogsView> {
  final keyScaffoldState = new GlobalKey<ScaffoldState>();

  Catalog get entity => widget.entity;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Constants.Colors.WHITE_GRAY_SOFT,
      child: Scaffold(
        key: keyScaffoldState,
        resizeToAvoidBottomPadding: false,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: context.widthFull(),
                floating: false,
                pinned: true,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Constants.Colors.WHITE_GRAY_SOFT,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  titlePadding: EdgeInsets.all(0),
                  title: _appBar(),
                  background: Hero(
                    tag: widget.heroTag,
                    child: Material(
                      child: Container(
                        width: context.widthFull(),
                        height: context.widthFull(),
                        decoration: BoxDecoration(
                          color: Constants.Colors.BASE,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(entity.photo_1_url),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: _content(),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      title: Container(
        color: Colors.transparent,
        width: context.widthFull(),
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_left,
                  color: Constants.Colors.TEXT_BLACK,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'icon-splash',
                    child: Container(
                      child: Image(
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                        color: Constants.Colors.TEXT_BLACK,
                        image: new AssetImage(
                          Constants.Assets.OPANNAPO_500,
                        ),
                      ),
                    ),
                  ),
                  UIText.mediumAlignLeft(
                    text: ' opannapo.tea&co',
                    isBold: true,
                    letterSpacing: 2,
                    color: Constants.Colors.TEXT_BLACK,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.base(
              size: 20,
              text: "${widget.entity.brand_name}",
              isBold: true,
              letterSpacing: 2,
              color: Constants.Colors.GOLD_1,
            ),
            UIText.base(
              size: 16,
              text: "${widget.entity.product_name}",
              isBold: true,
              letterSpacing: 2,
              color: Constants.Colors.TEXT_BLACK,
            ),
            Divider(
                height: 20,
                thickness: 2,
                color: Constants.Colors.WHITE_GRAY_SOFT),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.all(0),
                itemCount: entity.modifiers.length,
                itemBuilder: (context, index) {
                  Catalog_modifier modifier = entity.modifiers[index];
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIText.base(
                            text: '${modifier.modifier_name}',
                            size: 16,
                            isBold: true,
                            letterSpacing: 0,
                            color: Constants.Colors.TEXT_BLACK,
                          ),
                          Container(
                            child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              padding: EdgeInsets.all(0),
                              itemCount: modifier.options.length,
                              itemBuilder: (context, index) {
                                Catalog_modifier_option option =
                                    modifier.options[index];
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.fastfood,
                                        size: 14,
                                      ),
                                      UIText.base(
                                        text: '  ${option.option_name}',
                                        size: 16,
                                        isBold: false,
                                        letterSpacing: 0,
                                        color: Constants.Colors.TEXT_BLACK,
                                      ),
                                      UIText.base(
                                        text: ' - Rp.${option.price}',
                                        size: 16,
                                        isBold: false,
                                        letterSpacing: 0,
                                        color: Constants.Colors.TEXT_BLACK,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onClick(Catalog data) {}
}
