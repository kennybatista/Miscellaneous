//
//  SecondViewController.swift
//  DelegateExample2
//
//  Created by Kenny Batista on 3/15/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button(_ sender: Any) {
        print(#function)
        delegate?.notify(string: "Sending Data from VC2")
    }


}


protocol SecondViewControllerDelegate {
    func notify(string: String)
}
