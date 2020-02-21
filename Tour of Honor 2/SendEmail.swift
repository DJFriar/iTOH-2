//
//  SendEmail.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/20/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
// Medium link: https://medium.com/@florentmorin/messageui-swiftui-and-uikit-integration-82d91159b0bd
// Sample source code: https://github.com/florentmorin/SwiftUIAndMessageUI

//import SwiftUI
//import MessageUI
//
///// Main View
//struct MailView: View {
//
//    /// The delegate required by `MFMailComposeViewController`
//    private let mailComposeDelegate = MailDelegate()
//
//    /// The delegate required by `MFMessageComposeViewController`
//    private let messageComposeDelegate = MessageDelegate()
//
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Button(action: {
//                self.presentMailCompose()
//            }) {
//                Text("Send email")
//            }
//            Spacer()
//            Button(action: {
//                self.presentMessageCompose()
//            }) {
//                Text("Send message")
//            }
//            Spacer()
//        }
//    }
//
//}
//
//// MARK: The mail part
//extension MailView {
//
//    /// Delegate for view controller as `MFMailComposeViewControllerDelegate`
//    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {
//
//        func mailComposeController(_ controller: MFMailComposeViewController,
//                                   didFinishWith result: MFMailComposeResult,
//                                   error: Error?) {
//            <# Customize here #>
//            controller.dismiss(animated: true)
//        }
//
//    }
//
//    /// Present an mail compose view controller modally in UIKit environment
//    private func presentMailCompose() {
//        guard MFMailComposeViewController.canSendMail() else {
//            return
//        }
//        let vc = UIApplication.shared.keyWindow?.rootViewController
//
//        let composeVC = MFMailComposeViewController()
//        composeVC.mailComposeDelegate = mailComposeDelegate
//
//        <# Customize here #>
//
//        vc?.present(composeVC, animated: true)
//    }
//}
//
//// MARK: The message part
//extension MailView {
//
//    /// Delegate for view controller as `MFMessageComposeViewControllerDelegate`
//    private class MessageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
//        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
//            // Customize here
//            controller.dismiss(animated: true)
//        }
//
//    }
//
//    /// Present an message compose view controller modally in UIKit environment
//    private func presentMessageCompose() {
//        guard MFMessageComposeViewController.canSendText() else {
//            return
//        }
//        let vc = UIApplication.shared.keyWindow?.rootViewController
//
//        let composeVC = MFMessageComposeViewController()
//        composeVC.messageComposeDelegate = messageComposeDelegate
//
//        <# Customize here #>
//
//        vc?.present(composeVC, animated: true)
//    }
//}
//
//#if DEBUG
//struct MailView_Previews : PreviewProvider {
//    static var previews: some View {
//        MailView()
//    }
//}
//#endif
