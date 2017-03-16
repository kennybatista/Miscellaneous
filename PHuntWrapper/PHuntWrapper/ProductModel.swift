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
            
            var products = [ProductModelStruct]()
            
            let flatMappedPosts = posts.flatMap { $0 }
            
            
            for post in flatMappedPosts {
                let name = post["name"]!!
                let tagline = post["tagline"]!!
                let votesCount = post["votes_count"]!!
                let thumbnailDictionary: AnyObject = (post["thumbnail"] as AnyObject)
                let link = thumbnailDictionary["image_url"]!!
                let productID = post["id"]!!
                
                
                let productModelStruct = ProductModelStruct(productName: String(describing: name), productTagline: String(describing: tagline), productNumberOfVotes: String(describing: votesCount), productThumbnail: String(describing: link), productID: String(describing: productID))
                
                products.append(productModelStruct)
                
//                self.productModelArray.append(ProductModel(productName: String(describing: name), productTagline: String(describing: tagline), productNumberOfVotes: String(describing: votesCount), productThumbnail: String(describing: link), productID: String(describing: productID))!)
//                
                //                                for product in self.productModelArray {
                //                                    print(product.productID)
                //                                }
                
                
                
//            }
            
        }
    }
}


struct ProductModelStruct {
    var productName: String!
    var productTagline: String!
    var productNumberOfVotes: String!
    var productThumbnail: String!
    var productID: String!
}








//
//class ProductModel {
//    var productName: String!
//    var productTagline: String!
//    var productNumberOfVotes: String!
//    var productThumbnail: String!
//    var productID: String!
//    
//    init?(productName: String?, productTagline: String?, productNumberOfVotes: String?, productThumbnail: String?, productID: String?)
//    {
//        
//        if productName != nil {
//            self.productName = productName
//        } else {
//            print(productName!, " is nil")
//        }
//        
//        
//        if productTagline != nil {
//            self.productTagline = productTagline
//        } else {
//            print(productTagline!, " is nil")
//        }
//        
//        if productNumberOfVotes != nil {
//            self.productNumberOfVotes = productNumberOfVotes
//        } else {
//            print(productNumberOfVotes!, " is nil")
//        }
//        
//        if productThumbnail != nil {
//            self.productThumbnail = productThumbnail
//        } else {
//            print(productThumbnail!, " is nil")
//        }
//        
//        if productID != nil {
//            self.productID = productID
//        } else {
//            print(productID!, " is nil")
//        }
//        
//    }
//}
