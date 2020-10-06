//
//  Listing.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import Foundation


struct Listing {
    var title: String
}

#if DEBUG
let testDataTasks = [
    Listing(title: "Brightside Barbershop"),
    Listing(title: "Ajax Restaurant"),
    Listing(title: "Angie's Pie Shop"),
]
#endif
