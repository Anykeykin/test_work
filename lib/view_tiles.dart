import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewTiles extends StatelessWidget {
  final x;
  final y;
  ViewTiles(this.x, this.y);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
                  (route) => false,
            );
          },
        ),
        title: Text('Выбранная плитка'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: kIsWeb? Text('Сайт')
              :WebView(
                initialUrl: 'https://core-carparks-renderer-lots.maps.yandex.net/maps-rdr-carparks/tiles?l=carparks&x=${x}&y=${y}&z=19&scale=1&lang=ru_RU',
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  child: Text('Ответ(${x} - ${y})'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
