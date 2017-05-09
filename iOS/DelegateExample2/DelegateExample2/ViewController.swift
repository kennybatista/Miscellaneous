//
//  ViewController.swift
//  DelegateExample2
//
//  Created by Kenny Batista on 3/15/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func notify(string: String) {
        print(string)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let sender = segue.destination as! SecondViewController
            sender.delegate = self
        }
    }


}

