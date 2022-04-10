//
//  Quote.swift
//  Quotes App
//
//  Created by Robert Miller on 4/9/22.
//

import Foundation

//Class for quote cards and quotes used in the app
struct Quote: Identifiable, Decodable {
    
    //properties needed for class's data
    var id:UUID?
    var image:String
    var cardQuote:String
    var author:String
    var quotes:[String]
    
    //Create func that creates test data that can be used in other views
    static func testData() -> Quote {
        let testQuote = Quote(id:UUID(), image:"Naruto", cardQuote:"Test Quote", author:"Test Author", quotes:["quote 1", "quote 2"])
        
        return testQuote
    }
    
}
