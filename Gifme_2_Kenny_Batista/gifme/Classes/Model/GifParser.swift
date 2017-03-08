//
//  GifParser.swift
//  gifme
//
//  Created by Matt Greenwell on 12/19/16.
//  Copyright © 2016 William Kalish. All rights reserved.
//

import Foundation

class GMGifParser {
    class func parseGifs(_ json: Any) -> [Gif] {
        if let dictionary = json as? [String : Any] {
            let gifDicts = dictionary["data"] as? [Any]
        
            var gifs = [Gif]()

            for gifDict in gifDicts! {
                if let gifDict = gifDict as? [String : Any] {
                    let images = gifDict["images"] as? [String : Any]
                    let image = images?["fixed_width"] as? [String : Any]
                    let urlString = image?["url"] as? String
                    let url = URL(string: urlString!)
                
                    let gif = Gif(url: url!)
                    gifs.append(gif)
                }
            }
            return gifs
        }
        return [Gif]()
    }
}

struct Gif {
    let url: URL
}
