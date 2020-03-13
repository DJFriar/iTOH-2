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
        vc.setToRecipients(["testing@tommyc.net"])
        vc.setSubject("2020_\(riderFlagNumber)_\(activeBonus.category)_\(activeBonus.city)_\(activeBonus.state)_\(activeBonus.code)")
        vc.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
