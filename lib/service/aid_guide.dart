import '../utils/dio_http.dart';

class AidGuideService {
  /// 单例模式
  static AidGuideService? _instance;
  factory AidGuideService() => _instance ?? AidGuideService._internal();
  static AidGuideService? get instance => _instance ?? AidGuideService._internal();

  /// 初始化
  AidGuideService._internal() {
    // 初始化基本选项
  }

  /// 获取权限列表
  getGuideDetails(String guideTitle) async {
    /// 开启日志打印
    DioUtil.instance?.openLog();

    /// 发起网络接口请求
    var result = await DioUtil().request('/getGuideDetails/$guideTitle', method: DioMethod.get);
    var data = result['data'];
    var one = data['one'];
    var guideContext = one['guideContext'];
    return guideContext;
  }

}
