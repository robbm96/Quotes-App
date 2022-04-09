//
//  Quote.swift
//  Quotes App
//
//  Created by Robert Miller on 4/9/22.
//

import Foundation

//Class for quote cards and quotes used in the app
class Quote: Identifiable, Decodable {
    
    //properties needed for class's data
    var id:UUID?
    var image:String
    var cardQuote:String
    var author:String
    var quotes:[String]
}
