import 'package:art_core/extensions/widgets_extensions.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:art_core/widgets/app_loader.dart';
import 'package:art_core/widgets/app_text_field.dart';
import 'package:art_core/widgets/search_view/bloc/search_bloc.dart';
import 'package:art_core/widgets/search_view/bloc/search_event.dart';
import 'package:art_core/widgets/search_view/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class SearchableListView extends StatefulWidget {
  const SearchableListView({super.key, required this.onTap, required this.searchableList});

  final Function(SearchModel) onTap;
  final List<SearchModel> searchableList;

  @override
  State<SearchableListView> createState() => _SearchableListViewState();
}

class _SearchableListViewState extends State<SearchableListView> {
  @override
  Widget build(BuildContext context) {
    return widget.searchableList.isEmpty
        ? const AppLoader()
        : BlocProvider(
            create: (context) => SearchBloc()..add(InitEvent(searchableList: widget.searchableList)),
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                height: 300.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      return AppTextField(
                        onChanged: (v) {
                          SearchBloc.of(context).add(OnSearchEvent(query: v));
                        },
                        onTap: () {},
                        controller: TextEditingController(),
                        hint: 'search'.tr(),
                      );
                    }),
                    SizedBox(height: 16.h),
                    BlocConsumer<SearchBloc, List<SearchModel>>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return Expanded(
                            child: ListView.builder(
                          itemCount: state.length,
                          itemBuilder: (context, index) => Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () {
                                    widget.onTap(state[index]);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        style: AppTextStyle.of(context).blackRegular16,
                                        state[index].val,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ));
                      },
                    )
                  ],
                ).marginSymmetric(vertical: 10.h, horizontal: 24.w),
              ),
            ),
          );
  }
}
