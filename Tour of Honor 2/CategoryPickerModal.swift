//
//  CategoryPickerModal.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/10/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct CategoryPickerModal: View {
    @Binding var showCategoryModal: Bool

    var body: some View {
        VStack {
                Button(action: {
                    self.showCategoryModal = false
                }, label: {
                    Text("Cancel")
                })
        }
    }
}

struct CategoryPickerModal_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPickerModal(showCategoryModal: .constant(false))
    }
}
