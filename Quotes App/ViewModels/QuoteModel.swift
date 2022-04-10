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
    
    
    //Set initializer that will assign data returned from the decoder to quotes array
    init() {
        quotes.self = getLocalData()
    }
    
    //Function used to get the data from the JSON file and return it as an array
    //Use static keyword so that we can call this function without having to create an instance of this class since it is only being used to call this function
    func getLocalData() -> [Quote] {
        
        //Get a url path to the JSON file
        //Return a String optional
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        //Validate that pathString is not nil
        guard pathString != nil else{
            return [Quote]()
        }
        
        //Create a url object from the pathString
        //Unwrap pathString since it is an optional
        let url = URL(fileURLWithPath: pathString!)
        
        //Create a data object from the url object
        //Since the Data class can throw an error, we must utilize do-try-catch
        do{
            let data = try Data(contentsOf: url)
            
            //Initaliate decoder object
            let decoder = JSONDecoder()
            
            //Decode the data with a JSON Decoder
            //Utilize do-try-catch since decode class can throw an error
            do{
                let quoteData = try decoder.decode([Quote].self, from: data)
                
                //Add unique IDs
                //Use the for-in loop in this example since out Quote model is a struct and not a class.
                //This loop needs to be used whe the mode is a value type
                for index in 0..<quotes.count{
                    quotes[index].id = UUID()
                }
                
                //Return decoded data
                return quoteData
            }
            catch{
                //Error decoding data
                print(error)
            }
        }
        catch{
            //Error getting data
            print(error)
        }
        
        //Return an empty array code falls through after guard statement
        return [Quote]()
    }
}
