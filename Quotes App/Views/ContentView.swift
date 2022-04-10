//
//  ContentView.swift
//  Quotes App
//
//  Created by Robert Miller on 4/9/22.
//

import SwiftUI

struct ContentView: View {
    
    //Create a QuoteModel object
    //Use @ObservedObject wrapper so we can see changed made to QuoteModel and the array
    @ObservedObject var model = QuoteModel()
    
    var body: some View {
        
        
        //Use ScrollView container to generate quote card images
        NavigationView {
            ScrollView{
                VStack{
                    
                    //Generate card for each author and cardQuote
                    ForEach(model.quotes) { q in
                        //Will iterate through each quote object in the quote array
                        NavigationLink(destination: DetailView(quote: q), label: {
                            
                            //Each quote card in the ScrollView
                            Card(quote: q)
                        })
                    }
                }
            }.navigationBarTitle("Quotes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
