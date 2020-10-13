import 'package:flutter/material.dart';
import 'package:animecountdown/models/custom_nav_bar_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final int previousIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final List<CustomNavBarItem> items;
  final ValueChanged<int> onItemSelected;
  final double navBarHeight;
  final NavBarPadding padding;
  final Function(int) popAllScreensForTheSelectedTab;
  final bool popScreensOnTapOfSelectedTab;
  final ItemAnimationProperties itemAnimationProperties;
  final Color activeColor;
  final Color inactiveColor;

  CustomNavBarWidget({
    this.selectedIndex,
    this.previousIndex,
    this.showElevation = false,
    @required this.iconSize,
    this.backgroundColor,
    this.itemAnimationProperties,
    this.popScreensOnTapOfSelectedTab,
    this.navBarHeight = 0.0,
    @required this.items,
    this.popAllScreensForTheSelectedTab,
    @required this.onItemSelected,
    this.padding,
    @required this.inactiveColor,
    @required this.activeColor,
  });

  Widget _buildItem(CustomNavBarItem item, bool isSelected, double height) {
    return this.navBarHeight == 0
        ? SizedBox.shrink()
        : AnimatedContainer(
            width: 100.0,
            height: height / 1.0,
            duration: itemAnimationProperties?.duration ??
                Duration(milliseconds: 1000),
            curve: itemAnimationProperties?.curve ?? Curves.ease,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: itemAnimationProperties?.duration ??
                  Duration(milliseconds: 1000),
              curve: itemAnimationProperties?.curve ?? Curves.ease,
              alignment: Alignment.center,
              height: height / 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: FaIcon(
                    item.iconData,
                    color: isSelected ? activeColor : inactiveColor,
                    size: iconSize,
                  )),
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = ((MediaQuery.of(context).size.width -
            ((this.padding?.left ?? MediaQuery.of(context).size.width * 0.05) +
                (this.padding?.right ??
                    MediaQuery.of(context).size.width * 0.05))) /
        items.length);
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: this.navBarHeight,
      padding: EdgeInsets.only(
          top: this.padding?.top ?? 0.0,
          left: this.padding?.left ?? MediaQuery.of(context).size.width * 0.05,
          right:
              this.padding?.right ?? MediaQuery.of(context).size.width * 0.05,
          bottom: this.padding?.bottom ?? this.navBarHeight * 0.1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              AnimatedContainer(
                duration: itemAnimationProperties?.duration ??
                    Duration(milliseconds: 300),
                curve: itemAnimationProperties?.curve ?? Curves.ease,
                color: Colors.transparent,
                width: selectedIndex == 0
                    ? MediaQuery.of(context).size.width * 0.0
                    : itemWidth * selectedIndex,
                height: 4.0,
              ),
              Flexible(
                child: AnimatedContainer(
                  duration: itemAnimationProperties?.duration ??
                      Duration(milliseconds: 300),
                  curve: itemAnimationProperties?.curve ?? Curves.ease,
                  width: itemWidth,
                  height: 4.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: items.map((item) {
                  var index = items.indexOf(item);
                  return Flexible(
                    child: GestureDetector(
                      onTap: () {
                        if (this.popScreensOnTapOfSelectedTab &&
                            this.previousIndex == index) {
                          this.popAllScreensForTheSelectedTab(index);
                        }
                        this.onItemSelected(index);
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: _buildItem(
                            item, selectedIndex == index, this.navBarHeight),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
