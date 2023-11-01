//
//  PDFPreviewView.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/7/23.
//

import SwiftUI

import SwiftUI
import QuickLook

struct PDFPreviewView: UIViewControllerRepresentable {
    let fileURL: URL

    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: QLPreviewController, context: Context) {
        // No update needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(fileURL: fileURL)
    }

    class Coordinator: NSObject, QLPreviewControllerDataSource {
        let fileURL: URL

        init(fileURL: URL) {
            self.fileURL = fileURL
        }

        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }

        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return fileURL as QLPreviewItem
        }
    }
}


#Preview {
    PDFPreviewView(fileURL: URL(string: "file:///Users/ot/Library/Developer/CoreSimulator/Devices/D3D3D25B-0C3E-4615-BFEB-EB780C47DF42/data/Containers/Shared/AppGroup/91D00882-8EA5-4B2B-A0BF-71A4F42F4A7D/File%20Provider%20Storage/Testinggg.pdf")!)
}
