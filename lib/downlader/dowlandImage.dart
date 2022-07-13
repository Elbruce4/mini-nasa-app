import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_downloader/image_downloader.dart';

import '../toast/index.dart';

/* class DownladerImage extends StatefulWidget {
  const DownladerImage({Key? key}) : super(key: key);

  @override
  State<DownladerImage> createState() => _DownladerImageState();
}

class _DownladerImageState extends State<DownladerImage> {
  @override
  Widget build(BuildContext context) {
    
  }
} */

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
  var mimeType = await ImageDownloader.findMimeType(imageId);
  showToast("Se ha descargado la imagen correctamente","success",5, context);

} on PlatformException catch (error) {
  print(error);
}
}