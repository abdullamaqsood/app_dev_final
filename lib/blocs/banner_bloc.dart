import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/banner_model.dart';
import '../repositories/banner_repository.dart';

abstract class BannerEvent {}

class LoadBanners extends BannerEvent {}

abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final List<BannerModel> banners;
  BannerLoaded(this.banners);
}

class BannerError extends BannerState {
  final String message;
  BannerError(this.message);
}

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository repository;

  BannerBloc(this.repository) : super(BannerInitial()) {
    on<LoadBanners>((event, emit) async {
      emit(BannerLoading());
      try {
        final banners = await repository.fetchBanners();
        emit(BannerLoaded(banners));
      } catch (e) {
        emit(BannerError(e.toString()));
      }
    });
  }
}
