//: Playground - noun: a place where people can play

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet weak var cameraPreview: UIView!
    var session: AVCaptureSession?
    var input: AVCaptureDeviceInput?
    var output: AVCaptureStillImageOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize session an output variables this is necessary
        session = AVCaptureSession()
        output = AVCaptureStillImageOutput()
        let camera = getDevice(position: .back)
        do {
            input = try AVCaptureDeviceInput(device: camera)
        } catch let error as NSError {
            print(error)
            input = nil
        }
        if(session?.canAddInput(input) == true){
            session?.addInput(input)
            output?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            if(session?.canAddOutput(output) == true){
                session?.addOutput(output)
                previewLayer = AVCaptureVideoPreviewLayer(session: session)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                previewLayer?.frame = cameraPreview.bounds
                cameraPreview.layer.addSublayer(previewLayer!)
                session?.startRunning()
            }
        }
    }
    //Get the device (Front or Back)
    func getDevice(position: AVCaptureDevicePosition) -> AVCaptureDevice? {
        let devices: NSArray = AVCaptureDevice.devices() as NSArray;
        for de in devices {
            let deviceConverted = de as! AVCaptureDevice
            if(deviceConverted.position == position){
                return deviceConverted
            }
        }
        return nil
    }
}
