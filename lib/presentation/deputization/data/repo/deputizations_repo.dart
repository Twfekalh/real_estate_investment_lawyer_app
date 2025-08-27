import 'package:lawyer_app/presentation/deputization/presentation/bloc/deputizations_bloc.dart';

abstract class DeputizationsRepo {
  Future getAllDeputizations(GetDeputizationsEvent event, int page);
  Future processDeputizations(ProccessDeputazationEvent event);
}
