//
//  RetrievedDataModel.swift
//  PHuntWrapper
//
//  Created by Kenny Batista on 2/22/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import Foundation


class ResponseParser {
        class func parseResponse(_ jsonResponse: [String: [AnyObject]]) -> [ProductModelStruct] {
            if let posts = jsonResponse["posts"] {
                
                let flatMappedPosts = posts.flatMap { $0 }
                
                var products = [ProductModelStruct]()
                
                for post in flatMappedPosts {
                    let name = post["name"]!!
                    let tagline = post["tagline"]!!
                    let votesCount = post["votes_count"]!!
                    let thumbnailDictionary: AnyObject = (post["thumbnail"] as AnyObject)
                    let link = thumbnailDictionary["image_url"]!!
                    let productID = post["id"]!!
                    
                    
                    let productModelStruct = ProductModelStruct(productName: String(describing: name), productTagline: String(describing: tagline), productNumberOfVotes: String(describing: votesCount), productThumbnail: String(describing: link), productID: String(describing: productID))
                    
                    products.append(productModelStruct)
                    
            }
                return products
                
        }
            return [ProductModelStruct]()
    }
}


struct ProductModelStruct {
    var productName: String!
    var productTagline: String!
    var productNumberOfVotes: String!
    var productThumbnail: String!
    var productID: String!
}
