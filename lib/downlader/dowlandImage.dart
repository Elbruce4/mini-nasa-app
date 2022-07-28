import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_downloader/image_downloader.dart';

import '../toast/index.dart';

/* 
ImageDownloader.callback(onProgressUpdate: (String imageId, int _progress) {
      setState(() {
        progress = _progress;
      });
    });
 */

image_Downlader (url , context) async {
  try {
  var imageId = await ImageDownloader.downloadImage(url ,
                                    destination: AndroidDestinationType.directoryDownloads
                                    );
  if (imageId == null) {
    return;
  }
  
  // Below is a method of obtaining saved image information.
  var fileName = await ImageDownloader.findName(imageId);
  var path = await ImageDownloader.findPath(imageId);
  var size = await ImageDownloader.findByteSize(imageId);
  print("size $size");
  var mimeType = await ImageDownloader.findMimeType(imageId);
  print("type: $mimeType");
  showToast("Se ha descargado la imagen correctamente","success",5, context);

} on PlatformException catch (error) {
  showToast(error.toString(),"error",5, context);
}
}