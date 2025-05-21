import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lawyer_app/presentation/buy/data/models/buy/buy.request.add.images.dart';
import 'package:lawyer_app/presentation/buy/repo/add_images_repo_impl.dart';
import 'add_images_event.dart';
import 'add_images_state.dart';

class AddImagesBloc extends Bloc<AddImagesEvent, AddImagesState> {
  final AddImagesRepoImpl _repo;

  AddImagesBloc(this._repo) : super(AddImagesInitial()) {
    on<SubmitAddImagesEvent>(_onSubmitAddImages);
  }

  Future<void> _onSubmitAddImages(
    SubmitAddImagesEvent event,
    Emitter<AddImagesState> emit,
  ) async {
    emit(AddImagesLoadingState());

    final response = await _repo.addImages(event);

    if (response is AddImagesResponse) {
      emit(AddImagesSuccessState(addImagesResponse: response));
    } else {
      emit(AddImagesErrorState(helperResponse: response));
    }
  }
}
