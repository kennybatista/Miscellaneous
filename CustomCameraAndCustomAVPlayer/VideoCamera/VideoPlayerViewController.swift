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
    
    // Time Remaining
    fileprivate var timeObserver: AnyObject!
    fileprivate var timeRemainingLabel: UILabel!
    
    // Seeker buttons
    var playerRateBeforeSeek: Float = 0
    
    
    //    var seekFiveSecondsFowardButton: UIButton!
    //    var seekFiveSecondsBackwardButton: UIButton!
    //    var playOrPauseButton: UIButton!
    
    
    @IBOutlet weak var backwardsButtonOutlet: UIButton!
    
    @IBOutlet weak var playOrPauseButtonOutlet: UIButton!
    
    @IBOutlet weak var forwardButtonOutlet: UIButton!
    
    
    //    @IBAction func seekFiveSecondsBackwardButton(_ sender: Any) {
    //        seekForward()
    //    }
    //
    //    @IBAction func playOrPauseButton(_ sender: Any) {
    //        seekBackward()
    //    }
    //
    //
    //    @IBAction func seekFiveSecondsForwardButton(_ sender: Any) {
    //        pauseOrPlay()
    //    }
    
    
    var playPauseBool: Bool!
    
    
    
    
    @IBOutlet var controllerXibViewOutlet: UIView!
    
    
    // [End - Properties] ---------Properties-----------Properties-------------Properties---------------Properties----------
    
    
    //START - [METHODS ----------METHODS------------------------METHODS---------------------METHODS--------------------------- ]
    
 
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, urlPasser: URL){
        self.url = URL(string: String(describing: urlPasser))
        self.asset = AVURLAsset(url: url)
        self.item = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: item)
        self.playerLayer = AVPlayerLayer(player: player)
        super.init(nibName: "VideoPlayerViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        player.play()
        
        // time remaining
        let timeInterval: CMTime = CMTimeMakeWithSeconds(1.0, 10)
        timeObserver = player.addPeriodicTimeObserver(forInterval: timeInterval, queue: DispatchQueue.main, using: {
            elapsedTime in
            print("elapsedTime now", CMTimeGetSeconds(elapsedTime))
            self.observeTime(elapsedTime: elapsedTime)
            
            
            
        }) as AnyObject!
        
        
        
        
        playPauseBool = true
        
//        self.view.addSubview(controllerXibViewOutlet)
        
        //        forwardButtonOutlet.bringSubview(toFront: self.view)
    }
    
    deinit {
        player.removeTimeObserver(timeObserver)
    }
    
    override func loadView() {
        super.loadView()
//        view.backgroundColor = .yellow
//        view.layer.addSublayer(playerLayer)
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.borderColor = UIColor.red.cgColor
        playerLayer.cornerRadius = 10
        //        playerLayer.frame = view.bounds
        playerLayer.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        playerLayer.borderWidth = 5
        playerLayer.backgroundColor = UIColor.red.cgColor
        playerLayer.masksToBounds = true
        
        
        
        
        
        // Time remaining label
        timeRemainingLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        timeRemainingLabel.frame = CGRect(x: 5, y: 10, width: 60, height: 30)
        timeRemainingLabel.textColor = .red
        
//        view.addSubview(timeRemainingLabel)
        
        
        
        //        seekFiveSecondsFowardButton = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        //        seekFiveSecondsBackwardButton = UIButton(frame: CGRect(x: 150, y: 200, width: 100, height: 100))
        //        playOrPauseButton = UIButton(frame: CGRect(x: 250, y: 300, width: 100, height: 100))
        
        //        seekFiveSecondsFowardButton.setTitle("Forward", for: .normal)
        //        seekFiveSecondsBackwardButton.setTitle("Backward", for: .normal)
        //        playOrPauseButton.setTitle("PlayPause", for: .normal)
        
        //        seekFiveSecondsFowardButton.addTarget(self, action: #selector(VideoPlayerViewController.seekForward(button:elapsedTime:)), for: .touchUpInside)
        //        seekFiveSecondsBackwardButton.addTarget(self, action: #selector(VideoPlayerViewController.seekBackward(button:elapsedTime:)), for: .touchUpInside)
        //        playOrPauseButton.addTarget(self, action: #selector(VideoPlayerViewController.pauseOrPlay(button:)), for: .touchUpInside)
        
        //        view.addSubview(seekFiveSecondsFowardButton)
        //        view.addSubview(seekFiveSecondsBackwardButton)
        //        view.addSubview(playOrPauseButton)
        
        
        
    }
    
    
    // Start - Time Remaining Methods
    
    
    fileprivate func observeTime(elapsedTime: CMTime) {
        let duration = CMTimeGetSeconds((player.currentItem?.duration)!)
        let elapsedTime = CMTimeGetSeconds(elapsedTime)
        
        //updtae time label
        updateTimeLabel(elapsedTime: elapsedTime, duration: duration)
        
        //seek forward/backwards
    }
    
    fileprivate func updateTimeLabel(elapsedTime: Float64, duration: Float64) {
        //        let timeRemaining: Float64 = CMTimeGetSeconds(player.currentItem!.duration) - elapsedTime
        let currentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        timeRemainingLabel.text = String(format: "%02d:%02d", ((lround(currentTime) / 60) % 60), lround(currentTime) % 60)
        
    }
    
    
    fileprivate func currentPlayBackTime() -> CMTime {
        return (player.currentItem?.currentTime())!
    }
    
    fileprivate func seekForward(){
        print(#function)
        //        let targetTime = CMTimeMake(player.currentItem?.duration, 1)
        
        let preSubtractedCurrentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        let subtractedTime = preSubtractedCurrentTime + 5.0
        let convertedSubtractedTime = CMTimeMakeWithSeconds(subtractedTime, 1)
        self.player.seek(to: convertedSubtractedTime)
    }
    
    fileprivate func seekBackward(){
        print(#function)
        let preSubtractedCurrentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        let subtractedTime = preSubtractedCurrentTime - 5.0
        let convertedSubtractedTime = CMTimeMakeWithSeconds(subtractedTime, 1)
        self.player.seek(to: convertedSubtractedTime)
    }
    
    fileprivate func pauseOrPlay(){
        print(#function)
        if playPauseBool == false {
            playPauseBool = true
            player.pause()
        } else if playPauseBool == true {
            playPauseBool = false
            player.play()
        }
    }
    
    
    //End - Seeker Methods
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //[END - METHODS ----------METHODS------------------------METHODS---------------------METHODS--------------------------- ]
}
