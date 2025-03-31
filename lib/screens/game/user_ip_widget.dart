import 'dart:io';

import 'package:flutter/material.dart';
import 'package:one/styles.dart';

class UserIpWidget extends StatelessWidget {
  const UserIpWidget({super.key});

  Future<String?> getLocalIpAddress() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          return addr.address;
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLocalIpAddress(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!, style: headerTextStyle);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
