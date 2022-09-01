import 'package:dartz/dartz.dart';

import '../../core/failures/main_failure.dart';
import 'hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMoiveData();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData();
}
