// class Book {
//   final String id;
//   final String title;
//   final String author;
//   final String? publisher;
//   final String? year;
//   final String? language;
//   final String fileType;
//   final double fileSize;
//   final String? downloadLink;
//   final String? localPath; // New attribute for local file path
//   final bool isDownloaded; // New attribute to track download status

//   Book({
//     required this.id,
//     required this.title,
//     required this.author,
//     this.publisher,
//     this.year,
//     this.language,
//     required this.fileType,
//     required this.fileSize,
//     this.downloadLink,
//     this.localPath,
//     required this.isDownloaded,
//   });

//   // Factory constructor to create a Book object from JSON
//   factory Book.fromJson(Map<String, dynamic> json) {
//     // Parse the file size as a double, handling both String and double types
//     double parseFileSize(dynamic size) {
//       try {
//         if (size is String) {
//           return double.parse(size.replaceAll(RegExp(r'[^0-9.]'), ''));
//         } else if (size is double || size is int) {
//           return size.toDouble();
//         } else {
//           return 0.0;
//         }
//       } catch (e) {
//         return 0.0; // Fallback in case of parsing failure
//       }
//     }

//     // Helper function to sanitize and validate URLs
//     String? sanitizeUrl(String? url) {
//       if (url == null || url.isEmpty) return null;

//       // Check if the URL already starts with http or https
//       if (url.startsWith('http://') || url.startsWith('https://')) {
//         return url;
//       } else {
//         // Prepend the base URL if missing
//         return 'https://libgen.li${url.startsWith('/') ? '' : '/'}$url';
//       }
//     }

//     return Book(
//       id: json['id'] as String,
//       title: json['title'] as String,
//       author: json['author'] as String,
//       publisher: json['publisher'] as String?,
//       year: json['year'] as String?, // Keep as String for flexibility
//       language: json['language'] as String?, // Keep as String for flexibility
//       fileType: json['file_type'] as String,
//       fileSize: parseFileSize(json['file_size']), // Updated parsing logic
//       downloadLink:
//           sanitizeUrl(json['download_link'] as String?), // Proper URL handling
//       localPath: json['local_path'] as String?,
//       isDownloaded: json['is_downloaded'] as bool? ?? false, // Default to false
//     );
//   }

//   // Method to convert Book object to JSON (if needed for API calls)
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'author': author,
//       'publisher': publisher,
//       'year': year,
//       'language': language,
//       'file_type': fileType,
//       'file_size': fileSize,
//       'download_link': downloadLink,
//       'local_path': localPath,
//       'is_downloaded': isDownloaded,
//     };
//   }
// }

class Book {
  final String id;
  final String title;
  final String author;
  final String? publisher;
  final String? year;
  final String? language;
  final String fileType;
  final double fileSize;
  final String? downloadLink;
  final String? localPath;
  final bool isDownloaded;

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.publisher,
    this.year,
    this.language,
    required this.fileType,
    required this.fileSize,
    this.downloadLink,
    this.localPath,
    required this.isDownloaded,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    double parseFileSize(dynamic size) {
      if (size == null) return 0.0;
      try {
        if (size is String) {
          return double.parse(size.replaceAll(RegExp(r'[^0-9.]'), ''));
        } else if (size is num) {
          return size.toDouble();
        }
      } catch (_) {}
      return 0.0;
    }

    return Book(
      id: json['id']?.toString() ?? '', // Handle null id
      title: json['title'] ?? 'Unknown Title',
      author: json['author'] ?? 'Unknown Author',
      publisher: json['publisher'],
      year: json['year'],
      language: json['language'],
      fileType: json['file_type'] ?? '',
      fileSize: parseFileSize(json['file_size']),
      downloadLink: json['download_link'], // Directly use the link from backend
      localPath: null,
      isDownloaded: false,
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'publisher': publisher,
        'year': year,
        'language': language,
        'file_type': fileType,
        'file_size': fileSize,
        'download_link': downloadLink,
        'local_path': localPath,
        'is_downloaded': isDownloaded,
      };
}
