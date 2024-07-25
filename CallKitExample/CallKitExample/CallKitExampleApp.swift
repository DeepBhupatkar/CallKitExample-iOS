//
//  CallKitExampleApp.swift
//  CallKitExample
//
//  Created by Deep Bhupatkar on 25/07/24.
//

import PushKit
import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate, PKPushRegistryDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let pushRegistry = PKPushRegistry(queue: DispatchQueue.main)
        pushRegistry.delegate = self
        pushRegistry.desiredPushTypes = [.voIP]
        return true
    }

    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        // Handle updated push credentials
    }

    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        let uuid = UUID()
        let handle = "user@example.com" // Extract from payload
        CallManager.shared.reportIncomingCall(uuid: uuid, handle: handle)
        completion()
    }
}

@main
struct CallKitExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
