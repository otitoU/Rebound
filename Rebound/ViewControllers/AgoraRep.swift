//
//  AgoraRep.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/27/23.
//

import Foundation
import SwiftUI
import UIKit
import AgoraRtcKit

struct AgoraRep: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AgoraViewController {
        let agoraViewController = AgoraViewController()
        agoraViewController.agoraDelegate = context.coordinator
        return agoraViewController
    }

    func updateUIViewController(_ uiViewController: AgoraViewController, context: Context) {
        // You can update the view controller here if needed
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, AgoraRtcEngineDelegate {
        var parent: AgoraRep

        init(_ agoraRep: AgoraRep) {
            parent = agoraRep
        }
    }
}
