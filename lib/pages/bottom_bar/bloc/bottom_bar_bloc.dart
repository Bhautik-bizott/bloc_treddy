import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../constant/app_colors.dart';
import '../../../widget/bottomBarWidget.dart';
part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(const LandingPageInitial(tabIndex: 0)) {
    on<LandingPageEvent>((event, emit) {
      if (event is TabChange) {
        emit(LandingPageInitial(tabIndex: event.tabIndex));
      }
    });
  }
}