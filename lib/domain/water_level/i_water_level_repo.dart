abstract class IWaterLevelRepo {
  Stream<int> watchWaterLevel(String cityId);
}
