//
//  PublicViewController.swift
//  iOSSeminarChallenge
//
//  Created by Kenny Batista on 2/17/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit
import Alamofire

class PublicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var data: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = ""
        

        
        Alamofire.request("https://api.github.com/gists/public", method: .get, parameters: nil, headers: nil)
            .validate(contentType: ["application/json"])
            .validate().responseJSON() {
                response in
                print(response)
                
                if let json = response.result.value {
                     json = JSONEncoding(options: value as! JSONSerialization.WritingOptions)
                }
                
                let username = json[0]["owner"]
                
                
//                let dic = response[0] as [String: AnyObject]!
                
//                let username = dic["owner"]
//                let profilePicture = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "publicCell") as! PublicTableViewCell
        cell.userNameLabel.text = "hello"
        
        return cell
    }
}
