//
//  SendEmail.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/12/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
// Based on the 2nd answer provided at: https://stackoverflow.com/questions/56784722/swiftui-send-email

import SwiftUI
import UIKit
import MessageUI

struct MailView: UIViewControllerRepresentable {

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    @State var riderFlagNumber = UserDefaultsConfig.riderFlagNumber
    @State var pillionFlagNumber = UserDefaultsConfig.pillionFlagNumber
    @Binding var includePassenger: Bool
    @EnvironmentObject var activeBonus: ActiveBonus

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(["photos@tourofhonor.com"])
        if includePassenger {
            vc.setSubject("2021_\(riderFlagNumber)_\(pillionFlagNumber)_\(activeBonus.category)_\(activeBonus.state)_\(activeBonus.city)_\(activeBonus.code)")
        } else {
            vc.setSubject("2021_\(riderFlagNumber)_\(activeBonus.category)_\(activeBonus.state)_\(activeBonus.city)_\(activeBonus.code)")
        }
        vc.setMessageBody("", isHTML: true)
        
        // Add Primary Image
        let imageData1 = (ImageReader.getImageFromDocDir(named: activeBonus.primaryImage)?.jpegData(compressionQuality: 0.7))!
        vc.addAttachmentData(imageData1, mimeType: "image/jpeg", fileName: activeBonus.primaryImage)
        // Add Optional Image
        if activeBonus.alternateImage != "optional_2nd_Image.png" {
            let imageData2 = (ImageReader.getImageFromDocDir(named: activeBonus.alternateImage)?.jpegData(compressionQuality: 0.7))!
            vc.addAttachmentData(imageData2, mimeType: "image/jpeg", fileName: activeBonus.alternateImage)
        }
        
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
