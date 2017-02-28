//
//  RetrievedDataModel.swift
//  PHuntWrapper
//
//  Created by Kenny Batista on 2/22/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import Foundation
class ProductModel {
    var productName: String!
    var productTagline: String!
    var productNumberOfVotes: String!
    var productThumbnail: String!
    
    init?(productName: String?, productTagline: String?, productNumberOfVotes: String?, productThumbnail: String?) {
        
        if productName != nil {
            self.productName = productName
        } else {
            print(productName!, " is nil")
        }
        
        if productTagline != nil {
            self.productTagline = productTagline
        } else {
            print(productTagline!, " is nil")
        }
        
        if productNumberOfVotes != nil {
            self.productNumberOfVotes = productNumberOfVotes
        } else {
            print(productNumberOfVotes!, " is nil")
        }
        
        if productThumbnail != nil {
            self.productThumbnail = productThumbnail
        } else {
            print(productThumbnail!, " is nil")
        }
  
    }
}
