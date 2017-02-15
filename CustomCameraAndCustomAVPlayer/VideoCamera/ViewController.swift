//
//  ViewController.swift
//  VideoCamera
//
//  Created by Kenny Batista on 2/10/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit
//record, edit, audio and visual
import AVFoundation
//controls video output such as user controls and captions
import AVKit

class ViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {
    @IBOutlet weak var cameraButton: UIButton!
//[]
    //start/stop recording. use the preset to change output quality
    let captureSession = AVCaptureSession()

    // find out the camera devices
    var currentDevice: AVCaptureDevice?
    
    // 
    var videoFileOutput: AVCaptureMovieFileOutput?
    
    var cameraPreviewLayer:AVCaptureVideoPreviewLayer?
    
    var isRecording = false
    
    // Set up AVPlayer
    fileprivate var videoURL: URL!
    
    fileprivate var asset: AVURLAsset!
    fileprivate var playerItem: AVPlayerItem!
    fileprivate var player: AVPlayer!
    fileprivate var playerLayer: AVPlayerLayer!
    
    
    //playercontroller
    
    
    
    @IBOutlet weak var switchCamOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpVideoPreview()
    }
    
    func setUpVideoPreview(){
        // Do any additional setup after loading the view, typically from a nib.
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        // get default camera
        
        if let device: AVCaptureDevice = AVCaptureDevice.defaultDevice(withDeviceType: .builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: .front) {
            currentDevice = device
        } else if let device = AVCaptureDevice.defaultDevice(withDeviceType: .builtInDualCamera, mediaType: AVMediaTypeVideo, position: .front) {
            currentDevice = device
        }
        
        
        // get input data source
        guard let captureDeviceInput = try? AVCaptureDeviceInput(device: currentDevice)
            else {
                return
        }
        
        //[]
        
        videoFileOutput = AVCaptureMovieFileOutput()
        
        // now that we've set up the input and the output,  will flow the data from pointA to pointB
        captureSession.addInput(captureDeviceInput)
        captureSession.addOutput(videoFileOutput)
        
        //configure the session with the output for capture video - we can also use the output to record how long we want the video to be
        
        //[]
        
        //provide a camera preview
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(cameraPreviewLayer!)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        cameraPreviewLayer?.frame = view.layer.frame
        
        //Bring the camera button to front
        view.bringSubview(toFront: cameraButton)
        view.bringSubview(toFront: switchCamOutlet)
        
        captureSession.startRunning()

    }
    
    
    @IBAction func capture(_ sender: Any) {
        if !isRecording {
            isRecording = true
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
                Void in
                
                self.cameraButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }, completion: nil)
            
            let outputPath = NSTemporaryDirectory() + "output.mov"
            let outputFileURL = URL(fileURLWithPath: outputPath)
            videoFileOutput?.startRecording(toOutputFileURL: outputFileURL, recordingDelegate: self)
        } else {
            isRecording = false
            UIView.animate(withDuration: 0.5, delay: 1.0, options: [], animations: {
                Void in
                
                self.cameraButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
            cameraButton.layer.removeAllAnimations()
            videoFileOutput?.stopRecording()
            
            
        }
    }

    func capture(_ captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAt fileURL: URL!, fromConnections connections: [Any]!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        

        asset = AVURLAsset(url: fileURL)
        playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        
        playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = view.bounds
        
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true, completion: nil)
    }
    
    @IBAction func switchCam(_ sender: Any) {
        
//        captureDevice = (AVCaptureDevice.devices() as? [AVCaptureDevice])?
//            .filter({ $0.hasMediaType(AVMediaTypeVideo) && $0.position == .front}).first
        print(#function)
        setUpVideoPreview()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

