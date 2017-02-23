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
    var productNumberOfVotes: Int!
    var productThumbnail: String!
    
    init(productName: String, productTagline: String, productNumberOfVotes: Int, productThumbnail: String) {
        self.productName = productName
        self.productTagline = productTagline
        self.productNumberOfVotes = productNumberOfVotes
        self.productThumbnail = productThumbnail
    }
}
