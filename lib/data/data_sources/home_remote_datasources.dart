import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_client/domain/entities/chart_data_entity.dart';

abstract class HomeRemoteDataSources {
  Stream<List<ChartDataEntity>> getTempChartData();

  Stream<List<ChartDataEntity>> getWaterChartData();

  Future<List<ChartDataEntity>> getTempChartHistory();

  Future<List<ChartDataEntity>> getWaterChartHistory();
}

class HomeRemoteDataSourcesImpl extends HomeRemoteDataSources {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<ChartDataEntity>> getTempChartData() {
    return _firestore.collection('temp').snapshots().map(
          (QuerySnapshot querySnapshot) => querySnapshot.docs.map(
            (QueryDocumentSnapshot doc) {
              return ChartDataEntity.fromJson(
                  doc.data() as Map<String, dynamic>);
            },
          ).toList(),
        );
  }

  @override
  Stream<List<ChartDataEntity>> getWaterChartData() {
    return _firestore.collection('water').snapshots().map(
          (QuerySnapshot querySnapshot) => querySnapshot.docs.map(
            (QueryDocumentSnapshot doc) {
              return ChartDataEntity.fromJson(
                  doc.data() as Map<String, dynamic>);
            },
          ).toList(),
        );
  }

  @override
  Future<List<ChartDataEntity>> getTempChartHistory() async {
    final data =
        await _firestore.collection('temp').get().onError((error, stackTrace) {
      throw Exception(error.toString());
    });
    return data.docs
        .map(
          (e) => ChartDataEntity.fromJson(
            e.data(),
          ),
        )
        .toList();
  }

  @override
  Future<List<ChartDataEntity>> getWaterChartHistory() async {
    final data =
        await _firestore.collection('water').get().onError((error, stackTrace) {
      throw Exception(error.toString());
    });
    return data.docs
        .map(
          (e) => ChartDataEntity.fromJson(
            e.data(),
          ),
        )
        .toList();
  }
}
