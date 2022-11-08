import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'subscriptions_state.dart';

class SubscriptionsCubit extends Cubit<SubscriptionsState> {
  SubscriptionsCubit() : super(SubscriptionsInitial());
}
