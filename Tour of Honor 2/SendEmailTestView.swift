//
//  SendEmailTestView.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/12/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI
import MessageUI

struct MailViewTest: View {

   @State var result: Result<MFMailComposeResult, Error>? = nil
   @State var isShowingMailView = false

    var body: some View {
        Button(action: {
            self.isShowingMailView.toggle()
        }) {
            Text("Tap Me")
        }
        .disabled(!MFMailComposeViewController.canSendMail())
        .sheet(isPresented: $isShowingMailView) {
            MailView(result: self.$result)
        }
    }
}

struct MailViewTest_Previews: PreviewProvider {
    static var previews: some View {
        MailViewTest()
    }
}
