//
//  Card.swift
//  Quotes App
//
//  Created by Robert Miller on 4/9/22.
//

import SwiftUI

struct Card: View {
    
    var quote:Quote
    
    var body: some View {
        
        ZStack{
            
            //Generate background Image
            Image(quote.image)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 500, alignment: .center)
                .cornerRadius(15)
            
            //VStack to stack cardQuote and author
            VStack{
                Text(quote.cardQuote)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                //Author
                Text("- " + quote.author)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
            }
            //Modify all text elements in the VStack.shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
            
            
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(quote: Quote.testData())
    }
}
