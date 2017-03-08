//
//  GifTableviewController.swift
//  gifme
//
//  Created by Matt Greenwell on 12/19/16.
//  Copyright © 2016 William Kalish. All rights reserved.
//

import Foundation
import UIKit

class GifTableViewController: UITableViewController {
    let defaultSearchTerm = "cats"
    let gifCellReuseID = "GifCellReuseID"

    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    var gifs = [Gif]()
    var cache = NSCache<AnyObject, AnyObject>()

    // MARK: - View controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search
        search(forGif: defaultSearchTerm)
        
        //Activity Indicator
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.color = UIColor.red
    }

    func search(forGif searchTerm: String) {
        
        activityIndicator?.startAnimating()
        
        GMGiphyAPIClient.sharedClient.searchGif(searchTerm, completion: { [weak self] response in
            switch response {
            case .success(let responseData):
                self?.gifs = responseData.results
                
                // Reload Data Source methods
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
                
            case .failure(let error):
                NSLog(error.localizedDescription)
          
            }
            
        })
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifs.count
    }

    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: gifCellReuseID, for: indexPath) as? GifTableViewCell
        
        // Current gif url
        let gif = gifs[indexPath.row]
        
        // If image already cached, load from the cache. If not, then make the request that downloads the image, then cache it
        if self.cache.object(forKey: indexPath.row as AnyObject) != nil {
            
            print("Cached image used, no need to download it")
            let data = self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? Data
            cell?.gifImageView?.animate(withGIFData: data!)
            
        } else {
            
            //Session
            let session = URLSession.shared
            
            //Task
            session.dataTask(with: gif.url, completionHandler: { (data, response, error) in
            cell?.gifImageView?.animate(withGIFData: data!)
            self.cache.setObject(data as AnyObject, forKey: (indexPath as NSIndexPath).row as AnyObject)
            }).resume()
        }
        
        return cell!
    }
    
    
    
    
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Copy to clipboard
        let gif = gifs[indexPath.row]
        UIPasteboard.general.string = gif.url.absoluteString
        
        //Alert
        let alert = UIAlertController(title: "Copied", message: "Awesome! You've copied the link, share it with your friends :)", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Cool!", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    // MARK: - UISearchBarDelegate

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            if !text.isEmpty {
                
                //Remove current objects
                self.cache.removeAllObjects()
                self.gifs.removeAll()
                
                //Search
                search(forGif: text)
            } else {
                print("There is no text")
            }
        }
    }
}
