//
//  FeaturedCard.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI


struct FeaturedCard: View {
    
    var storeTitle: String
    var caption: String
    var image: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(height: 225, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                .cornerRadius(8.0)
            VStack(alignment: .leading) {
                Spacer()
                Text(storeTitle)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(caption)
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            .padding(.all)
            
        }
    }
}

struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        
            FeaturedCard(storeTitle: "Brightside Barber", caption: "Get any haircut for only $9", image: "barbershop")
        
    }
}
