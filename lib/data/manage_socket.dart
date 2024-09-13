import 'package:flutter/foundation.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import '../constant/app_apis.dart';
import '../constant/constant.dart';
import '../utils/enum.dart';

class StompSocketManage {
  late StompClient client;
  setStompSocket() async {
    var token = await storage.readString(key: Storage.TOKEN.type) ?? "";

    client = StompClient(
      config: StompConfig(
        url: 'ws://${Apis.baseURL}:8082/ws',
        beforeConnect: () async {
          if (kDebugMode) {
            print("beforeConnect");
          }
          // await Future.delayed(const Duration(milliseconds: 200));
        },
        onDisconnect: (frame) {
          activateFn();
          if (kDebugMode) {
            print("onDisconnect");
          }
        },
        onConnect: (frame) {
          if (kDebugMode) {
            print("Connected");
          }
        },
        onWebSocketError: (dynamic error) {
          if (kDebugMode) {
            print("Error : ${error.toString()}");
          }
        },
        onStompError: (frame) {
          if (kDebugMode) {
            print("Error : ${frame.body}");
          }
        },
        stompConnectHeaders: {'Authorization': 'Bearer $token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $token'},
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    activateFn();
    await Future.delayed(const Duration(seconds: 1));
    // subscribeFn(list);
  }

  unsubscribeFn() async {
    if (client.connected) {
      // for (var i in model!.rdata.list) {
      //   dynamic unsubscribeFn = client.subscribe(
      //     destination: '/ws-b/${i.instrumentId}',
      //     headers: {},
      //     callback: (frame) {
      //       print('alkjlfjakjfsfhjsdjshfkjshfjkhsfjkshfdjsfhdjksfhdskjhkj');
      //       print(frame.body);
      //     },
      //   );
      //   unsubscribeFn (unsubscribeHeaders: {});
      // }
      await deactivateFn();
    }
  }

  dynamic data;
  subscribeFn(list) async {
    // for (var i in list) {
    //   client.subscribe(
    //     destination: '/ws-b/${i.instrumentId}',
    //     headers: {},
    //     callback: (frame) {
    //       dynamic data = await socketManage.subscriptionData();
    //       if (kDebugMode) {
    //         print('datadlajkjkasdjasdkjadkljsadkljlkj');
    //         print(data);
    //       }
    //       setState(() {});
    //       var values = data.toString().split(",");
    //       String instrumentId = values[0];
    //       if (watchList.containsKey(instrumentId)) {
    //         ListElement? listElement = watchList[instrumentId];
    //         if (mounted) {
    //           setState(() {
    //             listElement?.ohlcLtp.ltp = values[1];
    //             listElement?.ohlcLtp.open = values[3];
    //             listElement?.ohlcLtp.high = values[4];
    //             listElement?.ohlcLtp.low = values[5];
    //             listElement?.ohlcLtp.close = values[6];
    //           });
    //         }
    //       } else {
    //         if (kDebugMode) {
    //           print("Instrument id $instrumentId not found in the map");
    //         }
    //       }
    //     },
    //   );
    // }
  }

  subscriptionData() {
    return data;
  }

  deactivateFn() {
    client.deactivate();
  }

  activateFn() {
    client.activate();
  }
}
