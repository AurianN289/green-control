import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './widgets/monitoring_card_widget.dart';

class GreenControlDashboardScreen extends StatelessWidget {
  const GreenControlDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Modified: Added missing opening parenthesis
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildActionButtonsRow1(context),
              SizedBox(height: 16.h),
              _buildActionButtonsRow2(context),
              SizedBox(height: 24.h),
              _buildDivider(),
              SizedBox(height: 24.h),
              _buildMonitoringCards(context),
              SizedBox(height: 24.h),
              _buildDivider(),
              SizedBox(height: 24.h),
              _buildStatusCards(context),
              SizedBox(
                  height: 24.h), // Modified: Added missing height parameter
              _buildDivider(),
            ],
          ),
        ),
      ),
    ); // Modified: Fixed closing parentheses structure
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      toolbarHeight: 72.h, // Modified: Changed 'height' to 'toolbarHeight'
      leading: GestureDetector(
        onTap: () {
          // Handle menu toggle
        },
        child: Container(
          padding: EdgeInsets.all(12.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIcon,
            height: 24.h,
            width: 24.h,
          ),
        ),
      ),
      centerTitle: true,
      title: CustomImageView(
        imagePath: ImageConstant.imgChatgptImage28DeJulDe20251256241,
        height: 47.h,
        width: 65.h,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // Handle profile tap
          },
          child: Container(
            padding: EdgeInsets.all(12.h),
            margin: EdgeInsets.only(right: 12.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconGray80001,
              height: 24.h,
              width: 24.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtonsRow1(BuildContext context) {
    return Row(children: [
      Expanded(
          child: GestureDetector(
              onTap: () {
                // Handle view history
              },
              child: Container(
                  height: 39.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF2F7D3C), width: 2.h),
                      borderRadius: BorderRadius.circular(10.h),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(26),
                            offset: Offset(0, 2.h),
                            blurRadius: 12.h),
                      ]),
                  child: Center(
                      child: Text('Ver Histórico',
                          style: TextStyleHelper.instance.body12Bold
                              .copyWith(color: Color(0xFF2F7D3C))))))),
      SizedBox(width: 16.h),
      Expanded(
          child: GestureDetector(
              onTap: () {
                // Handle manual mode
              },
              child: Container(
                  height: 39.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  decoration: BoxDecoration(
                      color: Color(0xFF57B46A),
                      borderRadius: BorderRadius.circular(10.h),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(26),
                            offset: Offset(0, 2.h),
                            blurRadius: 12.h),
                      ]),
                  child: Center(
                      child: Text('Modo Manual',
                          style: TextStyleHelper.instance.body12Bold
                              .copyWith(color: Colors.white)))))),
    ]);
  }

  Widget _buildActionButtonsRow2(BuildContext context) {
    return Row(children: [
      Expanded(
          child: GestureDetector(
              onTap: () {
                // Handle configure limits
              },
              child: Container(
                  height: 39.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF2F7D3C), width: 2.h),
                      borderRadius: BorderRadius.circular(10.h),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(26),
                            offset: Offset(0, 2.h),
                            blurRadius: 12.h),
                      ]),
                  child: Center(
                      child: Text('Configurar Limites',
                          style: TextStyleHelper.instance.body12Bold
                              .copyWith(color: Color(0xFF2F7D3C))))))),
      SizedBox(width: 16.h),
      Expanded(
          child: GestureDetector(
              onTap: () {
                // Handle pause automation
              },
              child: Container(
                  height: 39.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  decoration: BoxDecoration(
                      color: Color(0xFFD94D4D),
                      borderRadius: BorderRadius.circular(10.h),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(26),
                            offset: Offset(0, 2.h),
                            blurRadius: 12.h),
                      ]),
                  child: Center(
                      child: Text('Pausar Automação',
                          style: TextStyleHelper.instance.body12Bold
                              .copyWith(color: Colors.white)))))),
    ]);
  }

  Widget _buildDivider() {
    return Container(height: 1.h, color: Color(0xFFA1A1A1));
  }

  Widget _buildMonitoringCards(BuildContext context) {
    List<Map<String, dynamic>> monitoringData = [
      {
        'title': 'Temperatura',
        'value': '24',
        'unit': '°C',
        'status': 'Dentro do ideal',
        'statusColor': Color(0xFF1E7E34),
        'statusBgColor': Color(0xFFE8F7EE),
        'description': 'Ideal: 20–28 °C',
      },
      {
        'title': 'Umidade do Ar',
        'value': '65',
        'unit': '%',
        'status': 'Dentro do ideal',
        'statusColor': Color(0xFF1E7E34),
        'statusBgColor': Color(0xFFE8F7EE),
        'description': 'Ideal: 50–70%',
      },
      {
        'title': 'Umidade do Solo',
        'value': '28',
        'unit': '%',
        'status': 'Baixa — irrigar',
        'statusColor': Color(0xFF946200),
        'statusBgColor': Color(0xFFFFF7D6),
        'description': 'Mínimo configurado: 30%',
        'statusDotColor': Color(0xFFFFCC00),
      },
      {
        'title': 'CO₂',
        'value': '740',
        'unit': 'ppm',
        'status': 'Seguro',
        'statusColor': Color(0xFF1E7E34),
        'statusBgColor': Color(0xFFE8F7EE),
        'description': 'Faixa alvo: 600–900 ppm',
      },
    ];

    return Column(children: [
      Row(children: [
        Expanded(
            child: MonitoringCardWidget(
                title: monitoringData[0]['title'] ?? '',
                value: monitoringData[0]['value'] ?? '',
                unit: monitoringData[0]['unit'] ?? '',
                status: monitoringData[0]['status'] ?? '',
                statusColor:
                    monitoringData[0]['statusColor'] ?? Color(0xFF1E7E34),
                statusBgColor:
                    monitoringData[0]['statusBgColor'] ?? Color(0xFFE8F7EE),
                description: monitoringData[0]['description'] ?? '',
                statusDotColor: monitoringData[0]['statusDotColor'])),
        SizedBox(width: 24.h),
        Expanded(
            child: MonitoringCardWidget(
                title: monitoringData[1]['title'] ?? '',
                value: monitoringData[1]['value'] ?? '',
                unit: monitoringData[1]['unit'] ?? '',
                status: monitoringData[1]['status'] ?? '',
                statusColor:
                    monitoringData[1]['statusColor'] ?? Color(0xFF1E7E34),
                statusBgColor:
                    monitoringData[1]['statusBgColor'] ?? Color(0xFFE8F7EE),
                description: monitoringData[1]['description'] ?? '',
                statusDotColor: monitoringData[1]['statusDotColor'])),
      ]),
      SizedBox(height: 24.h),
      Row(children: [
        Expanded(
            child: MonitoringCardWidget(
                title: monitoringData[2]['title'] ?? '',
                value: monitoringData[2]['value'] ?? '',
                unit: monitoringData[2]['unit'] ?? '',
                status: monitoringData[2]['status'] ?? '',
                statusColor:
                    monitoringData[2]['statusColor'] ?? Color(0xFF946200),
                statusBgColor:
                    monitoringData[2]['statusBgColor'] ?? Color(0xFFFFF7D6),
                description: monitoringData[2]['description'] ?? '',
                statusDotColor:
                    monitoringData[2]['statusDotColor'] ?? Color(0xFFFFCC00))),
        SizedBox(width: 24.h),
        Expanded(
            child: MonitoringCardWidget(
                title: monitoringData[3]['title'] ?? '',
                value: monitoringData[3]['value'] ?? '',
                unit: monitoringData[3]['unit'] ?? '',
                status: monitoringData[3]['status'] ?? '',
                statusColor:
                    monitoringData[3]['statusColor'] ?? Color(0xFF1E7E34),
                statusBgColor:
                    monitoringData[3]['statusBgColor'] ?? Color(0xFFE8F7EE),
                description: monitoringData[3]['description'] ?? '',
                statusDotColor: monitoringData[3]['statusDotColor'])),
      ]),
    ]);
  }

  Widget _buildStatusCards(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.h),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(26),
                        offset: Offset(0, 2.h),
                        blurRadius: 12.h),
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: Color(0xFFE8F7EE),
                            borderRadius: BorderRadius.circular(13.h)),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                              width: 8.h,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  color: Color(0xFF1E7E34),
                                  shape: BoxShape.circle)),
                          SizedBox(width: 8.h),
                          Text('OK',
                              style: TextStyleHelper.instance.body12Bold
                                  .copyWith(color: Color(0xFF1E7E34))),
                        ])),
                    SizedBox(height: 12.h),
                    Text('Luminosidade',
                        style: TextStyleHelper.instance.body15Bold
                            .copyWith(color: Color(0xFF444444))),
                    SizedBox(height: 8.h),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text('8.100',
                          style: TextStyleHelper.instance.display31Bold
                              .copyWith(color: Color(0xFF2F7D3C), height: 1.2)),
                      SizedBox(width: 4.h),
                      Text('lx',
                          style: TextStyleHelper.instance.title16Bold
                              .copyWith(color: Color(0xFFA1A1A1), height: 1.2)),
                    ]),
                    SizedBox(height: 8.h),
                    Text('Iluminação artificial: desligada',
                        style: TextStyleHelper.instance.body13
                            .copyWith(color: Color(0xFFA1A1A1))),
                  ]))),
      SizedBox(width: 24.h),
      Expanded(
          child: Container(
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.h),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(26),
                        offset: Offset(0, 2.h),
                        blurRadius: 12.h),
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: Color(0xFFE8F7EE),
                            borderRadius: BorderRadius.circular(13.h)),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                              width: 8.h,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  color: Color(0xFF1E7E34),
                                  shape: BoxShape.circle)),
                          SizedBox(width: 8.h),
                          Text('Ativa',
                              style: TextStyleHelper.instance.body12Bold
                                  .copyWith(color: Color(0xFF1E7E34))),
                        ])),
                    SizedBox(height: 12.h),
                    Text('Status Irrigação',
                        style: TextStyleHelper.instance.body15Bold
                            .copyWith(color: Color(0xFF444444))),
                    SizedBox(height: 8.h),
                    Text('Auto',
                        style: TextStyleHelper.instance.display32Bold
                            .copyWith(color: Color(0xFF2F7D3C), height: 1.2)),
                    SizedBox(height: 16.h),
                    Text('Última execução: há 2h',
                        style: TextStyleHelper.instance.body13
                            .copyWith(color: Color(0xFFA1A1A1))),
                  ]))),
    ]);
  }
}
