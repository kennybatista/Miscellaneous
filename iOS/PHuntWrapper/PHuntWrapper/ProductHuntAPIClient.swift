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
    public let data: [ProductModelStruct]
}


class CallAPIClient {
    
    static let sharedClient = CallAPIClient()
    
    
    
   
    
    func fetchData(completion: @escaping CallCompletion) {
        //break enpoint into components
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.producthunt.com"
        urlComponents.path = "/v1/posts"
        let query = URLQueryItem(name: "access_token", value: "4d9636f7aebba4999289001cfcfc0414921b5305418bfad6b64136ab06b5ba05")
        urlComponents.queryItems = [query]
        
        let url = urlComponents.url
        
        
    }
    
    
    
    
    
    
}
