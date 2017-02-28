//
//  ViewController.swift
//  PHuntWrapper
//
//  Created by Kenny Batista on 2/13/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var productModelArray = [ProductModel]()
    
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
    
    var cache: NSCache<AnyObject, AnyObject>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cache = NSCache()
        
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
        task = session.dataTask(with: request, completionHandler: {
            data, urlResponse, error in
            
            
            print(urlResponse!)
            
            if error != nil {
                print("There is an error: ", error!)
            }
            
            if let dataReceived = data {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: dataReceived, options: .allowFragments) as? [String: [AnyObject]] {
                        
                        if let posts = json["posts"] {
                            let flatMappedPosts = posts.flatMap { $0 }
                            
                            
                            for post in flatMappedPosts {
                                let name = post["name"]!!
                                let tagline = post["tagline"]!!
                                let votesCount = post["votes_count"]!!
                                let thumbnailDictionary: AnyObject = (post["thumbnail"] as AnyObject)
                                let link = thumbnailDictionary["image_url"]!!
                                
                                self.productModelArray.append(ProductModel(productName: String(describing: name), productTagline: String(describing: tagline), productNumberOfVotes: String(describing: votesCount), productThumbnail: String(describing: link))!)
                                
                                for product in self.productModelArray {
                                    print(product.productThumbnail)
                                }
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                                
                            }

                        }
                        
                    } else {
                        print(error!)
                    }
                    
                } catch {
                    print(error)
                }
            }
        })
        task.resume()
        
        

   
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModelArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        cell.nameLabel.text = productModelArray[indexPath.row].productName
        cell.taglineLabel.text = productModelArray[indexPath.row].productTagline
        cell.numberOfVotesLabel.text = productModelArray[indexPath.row].productNumberOfVotes
        
        cell.thumbnailImageView.layer.cornerRadius = 10.0
        cell.numberOfVotesLabel.layer.cornerRadius = 10.0
        
        if cache.object(forKey: indexPath.row as AnyObject) != nil {
            print("Already cached, load from memory instead of downloading")
            cell.thumbnailImageView?.image = self.cache.object(forKey: indexPath.row as AnyObject) as? UIImage
            
        } else {
            let downloadlink: String = self.productModelArray[indexPath.row].productThumbnail
            let downloadURL: URL = URL(string: downloadlink)!
            task = session.downloadTask(with: downloadURL, completionHandler: { (url, response, error) in
                if let imageData = try? Data(contentsOf: downloadURL) {

                    DispatchQueue.main.async {
                        let img: UIImage = UIImage(data: imageData)!
                        self.cache.setObject(img, forKey: indexPath.row as AnyObject)
                        cell.thumbnailImageView.image = img
                        
                        self.tableView.reloadData()
                    }
                }
                
                
                
                
                
            })
            task.resume()
        }
        
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

