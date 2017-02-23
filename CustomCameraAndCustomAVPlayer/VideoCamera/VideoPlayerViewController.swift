//
//  VideoPlayerViewController.swift
//  VideoCamera
//
//  Created by Kenny Batista on 2/21/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit
import AVFoundation



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
    
    
    fileprivate var timeObserver: AnyObject!
    fileprivate var timeRemainingLabel: UILabel!
    
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
        
        
        let timeInterval: CMTime = CMTimeMakeWithSeconds(1.0, 10)
        timeObserver = player.addPeriodicTimeObserver(forInterval: timeInterval, queue: DispatchQueue.main, using: {
            elapsedTime in
            print("elapsedTime now", CMTimeGetSeconds(elapsedTime))
            self.observeTime(elapsedTime: elapsedTime)
        }) as AnyObject!
        
        
        
        
        
    }
    
    deinit {
        player.removeTimeObserver(timeObserver)
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
        
        
        
        
        let controlsHeight: CGFloat = 30
        let controlsY: CGFloat = view.bounds.size.height - controlsHeight
        // Time remaining label
        timeRemainingLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        timeRemainingLabel.frame = CGRect(x: 5, y: controlsY, width: 60, height: controlsHeight)
        timeRemainingLabel.textColor = .red
        
       
        view.addSubview(timeRemainingLabel)
        
        
    }
    
    
    
    fileprivate func updateTimeLabel(elapsedTime: Float64, duration: Float64) {
        let timeRemaining: Float64 = CMTimeGetSeconds(player.currentItem!.duration) - elapsedTime
        timeRemainingLabel.text = String(format: "%02d:%02d", ((lround(timeRemaining) / 60) % 60), lround(timeRemaining) % 60)
    }
    
    fileprivate func observeTime(elapsedTime: CMTime) {
        let duration = CMTimeGetSeconds((player.currentItem?.duration)!)
        let elapsedTime = CMTimeGetSeconds(elapsedTime)
        updateTimeLabel(elapsedTime: elapsedTime, duration: duration)
        
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //[END - METHODS ----------METHODS------------------------METHODS---------------------METHODS--------------------------- ]
}
