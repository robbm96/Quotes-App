//
//  QuoteModel.swift
//  Quotes App
//
//  Created by Robert Miller on 4/9/22.
//

import Foundation

class QuoteModel: ObservableObject {
    
    //Create an emty array of the Quote data type
    //Use @Published wrapper so changed can be seen
    @Published var quotes = [Quote]()
    
    init() {
        
        //Create and instance of DataService and get the data all in line of code.
        //Since getLocalData() used a static keyword, we were able to call it would having to create an instance of the DataService class
        self.quotes = DataServices.getLocalData()
    }
}
