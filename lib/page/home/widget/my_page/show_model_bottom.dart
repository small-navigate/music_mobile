import 'package:flutter/material.dart';
import '../../../../common/variable.dart';

// 底部弹出框
// ignore: missing_return
Function myShowModalBottomSheet(context, double height, count) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSize.BORDER_RADIUS),
        topRight: Radius.circular(AppSize.BORDER_RADIUS),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppSize.PADDING_SIZE_B),
              child: Text(
                '歌单$count',
                style: TextStyle(
                  color: Color(AppColors.FONT_COLOR),
                ),
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Color(0xffEDEDED),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print('我是去登录');
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: AppSize.PADDING_SIZE_S,
                  bottom: AppSize.PADDING_SIZE_S,
                  left: AppSize.PADDING_SIZE,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Color(0xffEDEDED),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      size: 28,
                    ),
                    SizedBox(width: AppSize.PADDING_SIZE),
                    Text('删除'),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}