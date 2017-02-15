//
//  ViewController.swift
//  NativeImageCaching
//
//  Created by Kenny Batista on 2/15/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var tableData:[AnyObject]!
    var task: URLSessionDownloadTask!
    var session: URLSession!
    
    var cache: NSCache<AnyObject, AnyObject>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Intialize Properties
        session = URLSession.shared
        task = URLSessionDownloadTask()
        
        self.tableData = []
        self.cache = NSCache()
        
        let url:URL! = URL(string: "https://itunes.apple.com/search?term=flappy&entity=software")
        task = session.downloadTask(with: url, completionHandler: { (location: URL?, response: URLResponse?, error: Error?) -> Void in
            
            if location != nil{
                let data:Data! = try? Data(contentsOf: location!)
                do{
                    let dic = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as AnyObject
                    self.tableData = dic.value(forKey : "results") as? [AnyObject]
                    
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
        let dictionary = self.tableData[(indexPath as NSIndexPath).row] as! [String:AnyObject]

        if self.cache.object(forKey: indexPath.row as AnyObject) != nil {
            // Use cache
            print("Cached image used, no need to download it")
            cell.mainImageView.image = self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? UIImage
        }else{
            
            let artworkUrl = dictionary["artworkUrl100"] as! String
            let url:URL! = URL(string: artworkUrl)
            
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
            if let data = try? Data(contentsOf: url){
                
                DispatchQueue.main.async {
                    
                    let img:UIImage! = UIImage(data: data)
                    cell.mainImageView.image = img
                    self.cache.setObject(img, forKey: (indexPath as NSIndexPath).row as AnyObject)
                    
                }
                
            }
        })
            task.resume()
        }
        return cell
    }


}

