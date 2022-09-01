import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:neetflix/domain/core/api_end_points.dart';
import 'package:neetflix/domain/hot_and_new/model/hot_and_new_resp.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/hot_and_new/model/hot_and_new_service.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMoiveData() async {
    try {
      final respones =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);
      if (respones.statusCode == 200 || respones.statusCode == 201) {
        final result = HotAndNewResp.fromJson(respones.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientfailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final respones = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTv);
      if (respones.statusCode == 200 || respones.statusCode == 201) {
        final result = HotAndNewResp.fromJson(respones.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientfailure());
    }
  }
}
