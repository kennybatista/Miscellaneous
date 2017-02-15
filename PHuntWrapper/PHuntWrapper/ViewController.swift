//
//  ViewController.swift
//  PHuntWrapper
//
//  Created by Kenny Batista on 2/13/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Set up the URL Request 
        let endPoint: URL = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let urlRequest = URLRequest(url: endPoint)
        
        //Set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        //Make the request
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            print(data!)
            
            if error != nil {
                print(error!)
            }
            
            if let data = data {
                print(data)
            }
            
            do {
                guard let json = try JSONSerialization.data(withJSONObject: data, options: []) as [String: AnyObject] else {
                    print("Error converting data")
                }
                
                print(json)
                
            } catch {
                
            }
            
            
            
        }
        task.resume()
        
        
//        //Build URL
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "api.producthunt.com"
//        urlComponents.path = "/v1"
//        urlComponents.query = "/posts"
        
////        let urlRequest = URLRequest(url: urlComponents)
//        
//        // add params
//        
////        let conceptQuery = NSURLQueryItem(name: "concept_tags", value: "false")
////        let hdQuery = NSURLQueryItem(name: "hd", value: "false")
////        let apiKeyQuery = NSURLQueryItem(name: "api_key", value: API_KEY)
////        urlComponents.queryItems = [dateQuery, conceptQuery, hdQuery, apiKeyQuery]
//        
//        let acceptJSON = URLQueryItem(name: "Accept", value: "application/json")
//        let contentType = URLQueryItem(name: "Content-Type", value: "application/json")
//        let authorization = URLQueryItem(name: "Authorization", value: "Bearer 4d9636f7aebba4999289001cfcfc0414921b5305418bfad6b64136ab06b5ba05")
//        let host = URLQueryItem(name: "Host", value: "api.producthunt.com")
//        
//        urlComponents.queryItems = [acceptJSON, contentType, authorization, host]
//        
//        
//        let request = URLSession.shared.dataTask(with: urlComponents.url!, completionHandler:{data, response, error in
//            if error != nil {
//                print(error!)
//            }
//            
//            // or 
////            guard error == nil else {
////                print(error!)
////                return
////            }
//            
//            if let data = data {
//                print(data)
//            } else {
//                print("error")
//            }
//            
//            //or
////            guard let data = data else {
////                print(data)
////                return
////            }
//            
//            
//            
//            
//                guard (try! JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]) != nil else {
//                    print("Error converting data")
//                    return
//                }
//         
//        })
//        
//        request.resume()
   
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

