//
//  DetailView.swift
//  Quotes App
//
//  Created by Robert Miller on 4/9/22.
//

import SwiftUI

struct DetailView: View {
    
    var quote:Quote
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20.0){
            
            //Generate author's name on top
            Text(quote.author)
                .font(.title)
                .fontWeight(.bold)
            
            //Generate quotes
            ForEach(quote.quotes, id:\.self) { quote in
                Text(quote)
            }
            
            Spacer()
        }
        .padding(.all)
        
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = QuoteModel()
        
        DetailView(quote: model.quotes[0])
    }
}
