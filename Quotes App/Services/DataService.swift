//
//  DataService.swift
//  Quotes App
//
//  Created by Robert Miller on 4/9/22.
//

import Foundation

class DataServices{
    
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
                for q in quoteData{
                    q.id = UUID()
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
