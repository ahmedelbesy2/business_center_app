

import 'package:core/core.dart';
import 'package:home/presentation/page/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton<OrderDataSrc>((i) => OrderDataSrcImpl(dioClientImpl: i()), export: true),
    // Bind.lazySingleton<OrderRepo>((i) => OrderRepoImpl(dataSrc: i()), export: true),
    // Bind.lazySingleton<OrderUseCase>((i) => OrderUseCase(repo: i()), export: true),
    // Bind.factory<OrderBloc>((i) => OrderBloc(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) =>  HomePage(),),
  ];
}
