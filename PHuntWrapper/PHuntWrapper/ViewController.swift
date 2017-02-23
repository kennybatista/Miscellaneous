//
//  ViewController.swift
//  PHuntWrapper
//
//  Created by Kenny Batista on 2/13/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var productModelArray = [ProductModel]()
    
    // request
    var request: URLRequest!
    
    //session configuration
    var config: URLSessionConfiguration!
    var session: URLSession!
    
    //url components
    var urlComponents: URLComponents!
    var accessTokenParamter: String!
    var accessTokenKey: String!
    
    var url: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //break enpoint into components
        urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.producthunt.com"
        urlComponents.path = "/v1/posts"
        let query = URLQueryItem(name: "access_token", value: "4d9636f7aebba4999289001cfcfc0414921b5305418bfad6b64136ab06b5ba05")
        urlComponents.queryItems = [query]
        
        url = urlComponents.url
        
        
        //access token
        accessTokenParamter = "?access_token="
        accessTokenKey = "4d9636f7aebba4999289001cfcfc0414921b5305418bfad6b64136ab06b5ba05"
        
        
        
        //request 
        request = URLRequest(url: url)
        
        //Set up the session
        config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
        
        //Make the request
        let task = session.dataTask(with: request, completionHandler: {
            data, urlResponse, error in
            
            
            print(urlResponse!)
            
            if error != nil {
                print("There is an error: ", error!)
            }
            
            if data != nil {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    
                } catch {
                    print("Error")
                }
            }
        })
    
    
        
        
        
        
        task.resume()
        
        

   
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

