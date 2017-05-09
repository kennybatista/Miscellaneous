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
    let defaultSearchTerm = "Cats"

    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    var gifs = [Gif]()
    var downloadedGifsArray = [Data]()
    var gifURLArray = [URL]()

    // MARK: - View controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)

        search(forGif: defaultSearchTerm)
        
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.color = UIColor.red
        
    }

    func search(forGif searchTerm: String) {
        print(#function)
        activityIndicator?.startAnimating()
        
        let giphyClient = GMGiphyAPIClient()
            
        giphyClient.searchGif(searchTerm, completion: { response in
            print(#function)
            switch response {
                case .success(let responseData):
                    
                    self.downloadedGifsArray.removeAll()
                    self.gifURLArray.removeAll()
                    
                    self.gifs = responseData.results
                    
                        
                        for gif in self.gifs {
                            let gifURL = gif.url
                            self.gifURLArray.append(gifURL)
                            
                            GMGiphyAPIClient.downloadGifs(url: gifURL, completion: { (data) in
                                self.downloadedGifsArray.append(data!)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            })
                            
                            
                        }
                    
                        self.activityIndicator.stopAnimating()
                
                case .failure(let error):
                    print(error.localizedDescription)
            }
        })
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("donwloaded gif count ", downloadedGifsArray.count)
        return downloadedGifsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "GifCellReuseID", for: indexPath) as! GifTableViewCell
        
        let gifData = self.downloadedGifsArray[indexPath.row]
        cell.gifImageView?.animate(withGIFData: gifData)

        return cell
    }
    
    
    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Copy to clipboard
        let gif = gifURLArray[indexPath.row]
        UIPasteboard.general.string = gif.absoluteString
        
        //Alert
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Copied", message: "Awesome! You've copied the link, share it with your friends :)", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Cool!", style: .default, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    // MARK: - UISearchBarDelegate

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            if text.isEmpty {
                print("The field is empty")
            } else {
                search(forGif: text)
                
            }
        }
    }
}
