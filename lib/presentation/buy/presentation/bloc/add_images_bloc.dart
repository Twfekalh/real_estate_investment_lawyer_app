import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/presentation/buy/data/models/buy/add_images_response/add_images_response.dart';

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
    print("the full image doc response ${response}");
    if (response is AddImagesResponse) {
      print("the procccccccc");
      emit(AddImagesSuccessState(addImagesResponse: response));
    } else {
      emit(AddImagesErrorState(helperResponse: response));
    }
  }
}
