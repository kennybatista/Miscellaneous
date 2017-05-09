//
//  DetailTableViewController.swift
//  PHuntWrapper
//
//  Created by Kenny Batista on 3/1/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    
    @IBOutlet var storyboardTableView: UITableView!
    
    var receivedID: String!
    
    
//    @IBOutlet weak var tableView: UITableView!
    
    var commentsArray: [String]!
    
    // request
    var request: URLRequest!
    
    //session configuration
    var config: URLSessionConfiguration!
    var session: URLSession!
    var task: URLSessionTask!
    
    //url components
    var urlComponents: URLComponents!
    var accessTokenParamter: String!
    var accessTokenKey: String!
    
    var url: URL!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.commentsArray = [String]()
        

        
        //break enpoint into components
        urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.producthunt.com"
        urlComponents.path = "/v1/posts/\(receivedID!)/comments"
        let query1 = URLQueryItem(name: "access_token", value: "4d9636f7aebba4999289001cfcfc0414921b5305418bfad6b64136ab06b5ba05")
        let query2 = URLQueryItem(name: "order", value: "desc")
        urlComponents.queryItems = [query1, query2]
        
        url = urlComponents.url
        
        
        //access token
        accessTokenParamter = "?access_token="
        accessTokenKey = "4d9636f7aebba4999289001cfcfc0414921b5305418bfad6b64136ab06b5ba05"
        
        
        
        //request
        request = URLRequest(url: url)
        
        //Set up the session
        config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
        
        
        
        // request
      
        
        task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error!)
            }
            
                            
            
                if let dataReceived = data {
                    do {
                        
                        if let json = try JSONSerialization.jsonObject(with: dataReceived, options: .allowFragments) as? [String: [AnyObject]] {
                            
                            if let comments = json["comments"] {
                                let flatMappedPosts = comments.flatMap { $0 }
//                                print(flatMappedPosts)
                                
                                for comment in flatMappedPosts {
                                    let body = comment["body"]!!
                                    self.commentsArray.append(body as! String)
                                    print(body)
                                }
                                
                                
                                DispatchQueue.main.async {
                                    self.storyboardTableView.reloadData()
                                }
                            }
                        }
                    } catch {
                        
                    }
                }
            
        })
        
        task.resume()
        
        print(url)
        
        print(#function)
        print("This is the received ID: ", receivedID)
        
        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commentsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
        cell.commentLabel.text = commentsArray[indexPath.row]
        
        
        
        return cell
    }
}
