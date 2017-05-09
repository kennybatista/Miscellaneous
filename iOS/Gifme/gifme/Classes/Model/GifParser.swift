//
//  GifParser.swift
//  gifme
//
//  Created by Matt Greenwell on 12/19/16.
//  Copyright © 2016 William Kalish. All rights reserved.
//

import Foundation

// struct that contains link
struct Gif {
    let url: URL
}

class GMGifParser {
    // Class func allows us to call this method from anywhere in the target without having to make an instance of the object
    // Our method takes in an any ( we can also send it json turned into foundation objects( array of array etc ) 
    // Then our method will return an array of Gif structs ( an array of structs that contain links )
    // The underscore allows us to ommit the passed in variable name when we call the function from somewhere else
    class func parseGifs(_ json: Any) -> [Gif] {
        
        // Array of gif structs ( just an array of structs that contain links )
        // Here we'll append the array of Gif structs
        var gifs: [Gif] = [Gif]()
        
        // We start parsing the json that is passed in
        // we cast the json into an array of dictionaries, where the dictionary values can also be arrays of arrays
        if let dictionary: [String: Any] = json as? [String : Any] {

            // in gifDicts we store the data array from the json
            let gifDicts: [Any] = dictionary["data"] as! [Any]
            
            // we then parse through the array ( data, aka gifDicts ) of arrays
            // gifDict will be an array of arrays, with values of dictionaries
            // We loop through the arrays of arrays
            for gifDict in gifDicts {
                
                // we store the one current array from the arrays in a variable, then cast it's value into a dictionary, which contains more dictionaries.
                if let gifDict = gifDict as? [String : Any] {
                    // from the current dictionary, grab it's images value, which is a dictionary. cast it to a dictionary
                    let images: [String : Any] = gifDict["images"] as! [String : Any]
                    let image: [String : Any] = images["fixed_width"] as! [String : Any]
                    // from the images dictionary grab the url value ( which is a link )
                    let urlString: String = image["url"] as! String
                    // store that value in a variable of type URL
                    let url: URL = URL(string: urlString)!
                    
                    // create an instance of the gif struct and pass it a url
                    let gif = Gif(url: url)
                    // append that url to our array of struct, which below we return
                    gifs.append(gif)
                }
            }
        }
        
        return gifs
    }
}
