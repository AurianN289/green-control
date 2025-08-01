import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class MonitoringCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String status;
  final Color statusColor;
  final Color statusBgColor;
  final String description;
  final Color? statusDotColor;

  const MonitoringCardWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
    required this.description,
    this.statusDotColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            offset: Offset(0, 2.h),
            blurRadius: 12.h,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.h),
            decoration: BoxDecoration(
              color: statusBgColor,
              borderRadius: BorderRadius.circular(13.h),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8.h,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: statusDotColor ?? statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.h),
                Text(
                  status,
                  style: TextStyleHelper.instance.body12Bold
                      .copyWith(color: statusColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyleHelper.instance.body15Bold
                .copyWith(color: Color(0xFF444444)),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyleHelper.instance.display31Bold
                    .copyWith(color: Color(0xFF2F7D3C), height: 1.2),
              ),
              SizedBox(width: 4.h),
              Text(
                unit,
                style: TextStyleHelper.instance.title16Bold
                    .copyWith(color: Color(0xFFA1A1A1), height: 1.2),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyleHelper.instance.body13
                .copyWith(color: Color(0xFFA1A1A1)),
          ),
        ],
      ),
    );
  }
}
