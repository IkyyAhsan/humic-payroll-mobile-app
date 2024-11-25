String shortenFileName(String fileName, {int maxLength = 10}) {
  if (fileName.isEmpty) return "No File";
  if (fileName.length <= maxLength) return fileName;
  return "${fileName.substring(0, maxLength)}...";
}
