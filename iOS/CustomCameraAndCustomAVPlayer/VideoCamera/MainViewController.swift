//
//  ViewController.swift
//  VideoCamera
//
//  Created by Kenny Batista on 2/10/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class MainViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    
     @IBOutlet weak var switchCamOutlet: UIButton!
    
    //[]
    //start/stop recording. use the preset to change output quality
    let captureSession = AVCaptureSession()
    
    // find out the camera devices
    var currentDevice: AVCaptureDevice?
    
    //
    var videoFileOutput: AVCaptureMovieFileOutput?
    
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var isRecording = false
    
    // Set up AVPlayer
    fileprivate var videoURL: URL!
    
    
    @IBOutlet weak var flashButtonOutlet: UIButton!
    @IBAction func flash(_ sender: Any) {
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        if (device?.hasTorch)! {
            do {
                try device?.lockForConfiguration()
                if device?.torchMode == AVCaptureTorchMode.on {
                    device?.torchMode = AVCaptureTorchMode.off
                } else {
                    do {
                        try device?.setTorchModeOnWithLevel(1.0)
                    } catch {
                        print(error)
                    }
                }
                device?.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpVideoPreview()
        
        cameraButton.layer.cornerRadius = 10
        
        view.bringSubview(toFront: flashButtonOutlet)
        
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
        
        
        captureSession.beginConfiguration()
        
        // Add audio device to the recording
        let audioDevice: AVCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeAudio)
        do {
            let audioInput: AVCaptureDeviceInput = try AVCaptureDeviceInput(device: audioDevice)
            self.captureSession.addInput(audioInput)
            
        } catch {
            print("Unable to add audio device to the recording.")
        }
        
        captureSession.commitConfiguration()
        
        
        
        
    }
    
    
    
    
    
    func cameraWith(position: AVCaptureDevicePosition) -> AVCaptureDevice! {
        let discovery = AVCaptureDeviceDiscoverySession(deviceTypes: [AVCaptureDeviceType.builtInWideAngleCamera, AVCaptureDeviceType.builtInDualCamera], mediaType: AVMediaTypeVideo, position: .unspecified) as AVCaptureDeviceDiscoverySession
        
        for device in discovery.devices as [AVCaptureDevice] {
            if device.position == position {
                return device
            }
        }
        
        return nil
    }
    
    
    
    
    
    
    func toggleCameraInput() {
        self.captureSession.beginConfiguration()
        
        var existingConnection: AVCaptureDeviceInput!
        
        for connection in self.captureSession.inputs {
            let input = connection as! AVCaptureDeviceInput
            
            if input.device.hasMediaType(AVMediaTypeVideo) {
                existingConnection = input
            }
        }
        
        self.captureSession.removeInput(existingConnection)
        
        
        var newCamera: AVCaptureDevice!
        
        if let oldCamera = existingConnection {
            if oldCamera.device.position == .front {
                newCamera = self.cameraWith(position: .back)
            } else {
                newCamera = self.cameraWith(position: .front)
            }
        }
        
        do {
            let newInput = try AVCaptureDeviceInput(device: newCamera)
            self.captureSession.addInput(newInput)
        } catch {
            print(error)
        }
        
        self.captureSession.commitConfiguration()
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
        
        
        let testLink = URL(string: "https://firebasestorage.googleapis.com/v0/b/vlogr-9384d.appspot.com/o/Videos%2F2017-02-17%2023:33:36%20%2B0000.MOV?alt=media&token=131e44a7-868a-43aa-987d-e35e4f6acaca")
        // When finished recording, pass the file url to our modular video component and play it
        let videoPlayer = KBVideoPlayerViewController(urlToPlayMediaFrom: testLink!)
        
        
        present(videoPlayer, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func switchCam(_ sender: Any) {
        print(#function)
        toggleCameraInput()
    }
    
    
    
}

