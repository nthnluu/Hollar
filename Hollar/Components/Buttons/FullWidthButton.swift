//
//  FullWidthButton.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI

struct FullWidthButton: View {
    var label: String
    
    var body: some View {
        Button(action: {}) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemGray5))
                    .cornerRadius(6.0)
                Text(label)
                    .fontWeight(.semibold)
                    .padding(.all, 11.0)
            }
            
        }
    }
}

struct FullWidthButton_Previews: PreviewProvider {
    static var previews: some View {
        FullWidthButton(label: "Button")
    }
}
