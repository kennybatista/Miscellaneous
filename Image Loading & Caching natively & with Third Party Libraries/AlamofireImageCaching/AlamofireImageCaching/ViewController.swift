//
//  ViewController.swift
//  AlamofireImageCaching
//
//  Created by Kenny Batista on 2/15/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    //Session properties
    var task: URLSessionDownloadTask!
    var session: URLSession!
    
    //Data and cache properties
    var tableData:[AnyObject]!
    var cache:NSCache<AnyObject, AnyObject>!
    var arrayOfImages: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize our properties
        session = URLSession.shared
        task = URLSessionDownloadTask()
        
        self.arrayOfImages = []
        self.tableData = []
        self.cache = NSCache()
        
        let url:URL! = URL(string: "https://itunes.apple.com/search?term=flappy&entity=software")
        task = session.downloadTask(with: url, completionHandler: { (location: URL?, response: URLResponse?, error: Error?) -> Void in
            
            if location != nil{
                let data: Data! = try? Data(contentsOf: location!)
                
                do{
                    let dic = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as AnyObject

                    self.tableData = dic.value(forKey : "results") as? [AnyObject]
                    
                    
                    for item in self.tableData {
                        let artworkUrl = item["artworkUrl100"] as! String
                        self.arrayOfImages.append(artworkUrl)
   
                    }

                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                }catch{
                    print("something went wrong, try again")
                }
            }
        })
        task.resume()
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCollectionViewCell
        
        let imageURL = self.arrayOfImages[indexPath.row]
        let url:URL! = URL(string: imageURL)
        
        cell.mainImageView.af_setImage(withURL: url)
        
        return cell
    }


}

