//
//  BottomDrawerView.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI
import DrawerView

struct BottomDrawerView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let drawerView = DrawerView()
        drawerView.attachTo(view: self)
        
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct BottomDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        BottomDrawerView()
    }
}
