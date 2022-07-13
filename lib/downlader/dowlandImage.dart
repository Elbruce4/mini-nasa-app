import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_downloader/image_downloader.dart';

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

image_Downlader (url) async {
  try {
  // Saved with this method.
  print("llega");
  var imageId = await ImageDownloader.downloadImage(url ,
                                    destination: AndroidDestinationType.directoryDownloads
                                    );
  if (imageId == null) {
    return;
  }
  print("paso esto");
  // Below is a method of obtaining saved image information.
  var fileName = await ImageDownloader.findName(imageId);
  var path = await ImageDownloader.findPath(imageId);
  var size = await ImageDownloader.findByteSize(imageId);
  var mimeType = await ImageDownloader.findMimeType(imageId);
} on PlatformException catch (error) {
  print(error);
}
}