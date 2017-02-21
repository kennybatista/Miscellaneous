//
//  VideoPlayerViewController.swift
//  VideoCamera
//
//  Created by Kenny Batista on 2/21/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit
import AVFoundation
//import AVKit


class VideoPlayerViewController: UIViewController {
    
// [Start - Properties] ---------Properties-----------Properties-------------Properties---------------Properties----------
    
    //url to get media from
    fileprivate var url: URL!
    
    // convert url to an asset
    fileprivate var asset: AVURLAsset!
    
    // make asset into an item
    fileprivate var item: AVPlayerItem!
    
    // player
    fileprivate var player: AVPlayer!
    
    //player layer 
    fileprivate var playerLayer: AVPlayerLayer!
    
// [End - Properties] ---------Properties-----------Properties-------------Properties---------------Properties----------

    
    //START - [METHODS ----------METHODS------------------------METHODS---------------------METHODS--------------------------- ]
    
    public init(urlPasser: URL) {
        super.init(nibName: nil, bundle: nil)
        self.url = URL(string: String(describing: urlPasser))
        self.asset = AVURLAsset(url: url)
        self.item = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: item)
        self.playerLayer = AVPlayerLayer(player: player)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        player.play()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .black
        view.layer.addSublayer(playerLayer)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.borderColor = UIColor.red.cgColor
        playerLayer.cornerRadius = 10
        playerLayer.frame = view.bounds
        playerLayer.borderWidth = 5
        playerLayer.backgroundColor = UIColor.blue.cgColor
        playerLayer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //[END - METHODS ----------METHODS------------------------METHODS---------------------METHODS--------------------------- ]
}
