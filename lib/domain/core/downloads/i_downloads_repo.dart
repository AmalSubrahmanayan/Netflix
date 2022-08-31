import 'package:dartz/dartz.dart';
import 'package:neetflix/domain/core/downloads/models/downloads.dart';
import 'package:neetflix/domain/core/failures/main_failure.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
