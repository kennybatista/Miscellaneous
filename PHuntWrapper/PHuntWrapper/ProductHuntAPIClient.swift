//
//  ProductHuntAPIClient.swift
//  PHuntWrapper
//
//  Created by Kenny Batista on 3/3/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import Foundation

typealias CallCompletion = (CallResponse) -> Void

enum CallResponse {
    case success(CallResponseData)
    case failure(Error)
}

struct CallResponseData {
    public let results: [ProductModel]
}
