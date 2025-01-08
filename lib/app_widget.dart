import 'dart:developer';

import 'package:art_core/app_helper.dart';
import 'package:art_core/art_core.dart';
import 'package:art_core/theme/theme_bloc/theme_state.dart';
import 'package:core/firebase_dynamic_link_helper/driver_firebase_dynamic_link_helper.dart';
import 'package:core/networking2/api_client/connection_cubit/connection_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool? locationIsDisabled;

  @override
  void initState() {
    //
    super.initState();

initNotificationService();
    Modular.to.addListener(() async {
      try {
        final page = Modular.to.path.split('/').lastWhere((element) => element != '');
        // await analytics.setCurrentScreen(screenName: page);
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        log(e.toString());
      }
    });


  }

  initNotificationService() async {
// await Modular.get<CloudNotificationService>().initNotificationService();

  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Modular.get<ThemeBloc>()),
        BlocProvider(create: (context) => Modular.get<ConnectionCubit>()..checkConnection()),

      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocConsumer<ConnectionCubit, InternetConnectionState>(
            listener: (context, internetState) {
              if (internetState is ConnectionSuccess) {}
              if (internetState is ConnectionFail) {}
            },
            builder: (context, internetState) {
              debugPrint('InternetState======>${internetState.toString()}');
              return SafeArea(
                maintainBottomViewPadding: true,
                top: false,
                child: ScreenUtilInit(
                    designSize: const Size(430, 932),
                    builder: (BuildContext context, Widget? child) {
                      return MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        title: 'prime',
                        theme: state.themeData,
                        routerDelegate: Modular.routerDelegate,
                        routeInformationParser: Modular.routeInformationParser,
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: context.locale,
                        builder: (context, child) {
                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              textScaler: const TextScaler.linear(1.0),
                            ),
                            child: Column(
                              children: [
                                // (locationIsDisabled ?? false)
                                //     ? Container(
                                //         padding: EdgeInsets.all(20)
                                //             .copyWith(top: 40.h, bottom: 0.0),
                                //         width: double.infinity,
                                //         color: Colors.red,
                                //         child: Row(children: [
                                //           Icon(Icons.location_disabled,
                                //               color: Colors.white),
                                //           SizedBox(width: 10.w),
                                //           Text(
                                //             'location_service_is_disabled'.tr(),
                                //           ),
                                //           Spacer(),
                                //           TextButton(
                                //             onPressed: () async {
                                //               if (Platform.isAndroid) {
                                //                 await location.requestService();
                                //               } else {
                                //                 AppSettings.openAppSettings(
                                //                     type: AppSettingsType
                                //                         .location);
                                //               }
                                //             },
                                //             child: Text('enable'.tr(),
                                //                 style: TextStyle(
                                //                     color: Colors.white)),
                                //           )
                                //         ]))
                                //     : SizedBox(),
                                if (internetState is ConnectionFail)
                                  Material(
                                    child: Container(
                                        padding: EdgeInsets.all(20).copyWith(top: 40.h, bottom: 20.h),
                                        width: double.infinity,
                                        color: Colors.red,
                                        child: Row(children: [
                                          SizedBox(width: 10.w),
                                          Text('no_connection'.tr(), style: const TextStyle(color: Colors.white)),
                                          const Spacer(),
                                          const Icon(
                                            Icons.signal_wifi_connected_no_internet_4,
                                            color: Colors.white,
                                          )
                                        ])),
                                  ),
                                Expanded(child: child!),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              );
            },
          );
        },
      ),
    );
  }
}
