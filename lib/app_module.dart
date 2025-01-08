import 'package:art_core/theme/theme_bloc/theme_bloc.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:home/home_module.dart';
class AppModule extends Module {
  @override
  List<Module> get imports => [
    HomeModule(),
  ];
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<PreferenceManager>((i) => PreferenceManager()),
    Bind.lazySingleton<ApiClientBloc>((i) => ApiClientBloc()),
    Bind.lazySingleton<DioClientImpl>((i) => DioClientImpl(apiClientBloc: i())),
    Bind.lazySingleton<DioClient>((i) => DioClient(configurations: ApiConfigurations(), preferenceManager: i())),
    Bind.lazySingleton<Dio>((i) => i<DioClient>().dio),
    Bind.lazySingleton<NetworkHandler>((i) => NetworkHandler(i())),
    Bind.lazySingleton<ThemeBloc>((i) => ThemeBloc(i())),
    Bind.lazySingleton<ConnectionCubit>((i) => ConnectionCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/", module: HomeModule()),

  ];
}
