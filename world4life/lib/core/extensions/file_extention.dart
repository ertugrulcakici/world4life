import "dart:io";

extension FileExtention on File {
  get convertToByte {
    return this.readAsBytesSync();
  }
}
