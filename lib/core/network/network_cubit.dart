import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit()
      : super(
          const NetworkState(
            isConnectionListening: false,
            hasConnection: false,
          ),
        );
  StreamSubscription<InternetConnectionStatus>? connectionStatusSubscription;
  final customInstance = InternetConnectionChecker.createInstance(
    checkInterval: const Duration(seconds: 5),
    addresses: [
      AddressCheckOptions(
        address: InternetAddress(
          '1.1.1.1', // CloudFlare
          type: InternetAddressType.IPv4,
        ),
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '2606:4700:4700::1111', // CloudFlare
          type: InternetAddressType.IPv6,
        ),
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '8.8.4.4', // Google
          type: InternetAddressType.IPv4,
        ),
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '2001:4860:4860::8888', // Google
          type: InternetAddressType.IPv6,
        ),
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '208.67.222.222', // OpenDNS
          type: InternetAddressType.IPv4,
        ), // OpenDNS
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '2620:0:ccc::2', // OpenDNS
          type: InternetAddressType.IPv6,
        ), // OpenDNS
      ),
    ],
  );

  Future<void> listenConnectionStatus() async {
    await connectionStatusSubscription?.cancel();
    emit(state.copyWith(isConnectionListening: true));
    connectionStatusSubscription =
        customInstance.onStatusChange.listen((internetConnectionStatus) {
      if (internetConnectionStatus == InternetConnectionStatus.connected) {
        emit(state.copyWith(hasConnection: true));
      } else {
        emit(state.copyWith(hasConnection: false));
      }
    });
  }

  @override
  Future<void> close() {
    connectionStatusSubscription?.cancel();
    return super.close();
  }
}
