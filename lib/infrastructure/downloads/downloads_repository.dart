import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:neetflix/domain/core/api_end_points.dart';
import 'package:neetflix/domain/core/downloads/i_downloads_repo.dart';
import 'package:neetflix/domain/core/failures/main_failure.dart';
import 'package:neetflix/domain/core/downloads/models/downloads.dart';

class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];
        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientfailure());
    }
  }
}
