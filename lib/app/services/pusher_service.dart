// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
// import 'package:overlay_support/overlay_support.dart';
// final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
// // app_id = "2022607"
// // key = "0aa411a89bab9964a823"
// // secret = "d9c92cd672129652ab8b"
// // cluster = "ap2"
// Future<void> initPusher() async {
//   try {
//     await pusher.init(
//       apiKey: '0aa411a89bab9964a823', // Replace with your actual Pusher API Key
//       cluster: 'ap2', // Replace with your actual Pusher Cluster (e.g., 'ap2', 'mt1')
//       onConnectionStateChange: (dynamic currentState, dynamic previousState) {
//         print('🔌 Connection state: $currentState (Previous: $previousState)');
//       },
//       onError: (String? message, int? code, dynamic e) {
//         print('❌ Pusher error: $message (Code: $code, Exception: $e)');
//       },
//       // --- FIX HERE: Global onEvent callback ---
//       onEvent: (dynamic eventData) {
//         if (eventData is PusherEvent) {
//           final event = eventData;
//           print('📨 Event "my-event" received: ${event.data}');
//
//           // Parse the message
//           try {
//             final decoded = json.decode(event.data ?? '{}');
//             final message = decoded['message'] ?? 'No message';
//
//             // Show in-app notification
//             showSimpleNotification(
//                 Text("this is a message from simple notification"),
//                 background: Colors.green);
//           } catch (e) {
//             print('❌ Failed to parse event data: $e');
//           }
//         }
//       },
//       onSubscriptionSucceeded: (String channelName, dynamic data) {
//         print('✅ Subscribed to $channelName successfully!');
//       },
//     );
//
//     await pusher.subscribe(
//       channelName: 'my-channel',
//       // --- FIX HERE: Channel-specific onEvent callback ---
//       onEvent: (dynamic eventData) { // Accept dynamic type
//         if (eventData is PusherEvent) { // Check if it's a PusherEvent
//           PusherEvent event = eventData; // Cast to PusherEvent
//           if (event.eventName == 'my-event') {
//             print('📨 Specific Event "my-event" received on ${event.channelName}');
//             print('📦 Data: ${event.data}');
//           } else {
//             print('Other event ${event.eventName} received on ${event.channelName} with data: ${event.data}');
//           }
//         } else {
//           print('📨 Channel event received (unknown type): $eventData');
//         }
//       },
//     );
//
//     await pusher.connect();
//
//   } catch (e) {
//     print('🔥 Pusher init failed: $e');
//   }
// }
//
