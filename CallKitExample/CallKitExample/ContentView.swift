//
//  ContentView.swift
//  CallKitExample
//
//  Created by Deep Bhupatkar on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var callManager = CallManager.shared

    var body: some View {
        VStack(spacing: 20) {
            Button("Start Call") {
                let uuid = UUID()
                let handle = "user@example.com"
                callManager.startCall(uuid: uuid, handle: handle)
            }
            
            Button("End Call") {
                let uuid = UUID() // Replace with the actual call UUID
                callManager.endCall(uuid: uuid)
            }

            Button("Report Incoming Call") {
                let uuid = UUID()
                let handle = "user@example.com"
                callManager.reportIncomingCall(uuid: uuid, handle: handle)
            }
        }
        .padding()
    }
}



