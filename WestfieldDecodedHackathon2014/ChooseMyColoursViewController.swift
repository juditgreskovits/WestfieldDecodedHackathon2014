//
//  ChooseMyColoursViewController.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices

class ChooseMyColoursViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    var captureDevice : AVCaptureDevice?
    
    let detector = CIDetector(ofType:CIDetectorTypeFace, context:nil, options:[CIDetectorAccuracy:CIDetectorAccuracyHigh, CIDetectorSmile:true, CIDetectorEyeBlink:true])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        let devices = AVCaptureDevice.devices()
        
        for device in devices {
            if(device.hasMediaType(AVMediaTypeVideo)) {
                if(device.position == AVCaptureDevicePosition.Front) {
                    captureDevice = device as? AVCaptureDevice
                    if(captureDevice != nil) {
                        println("Capture device found")
                        beginSession();
                    }
                    
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureDevice() {
        if let device = captureDevice {
            device.lockForConfiguration(nil)
            // device.focusMode = .Locked // what / why is this???
            device.unlockForConfiguration()
        }
    }
    
    func beginSession() {
        
        configureDevice()
        
        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        
        if(err != nil) {
            println("error: \(err?.localizedDescription)")
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.insertSublayer(previewLayer, atIndex:0)
        previewLayer?.frame = self.view.layer.frame
        
        /*let output = AVCaptureVideoDataOutput()
        let cameraQueue = dispatch_queue_create("cameraQueue", DISPATCH_QUEUE_SERIAL)
        output.setSampleBufferDelegate(self, queue: cameraQueue)
        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey: kCVPixelFormatType_32BGRA]
        captureSession.addOutput(output)*/
        
        captureSession.startRunning()
        
        /*dispatch_after(200, dispatch_get_main_queue(), {
            self.captureSession.stopRunning()
            self.navigateToMyColoursViewController()
        })*/
    }
    
    func navigateToMyColoursViewController() {
        let myColoursViewController = self.storyboard?.instantiateViewControllerWithIdentifier("myColoursViewController") as MyColoursViewController
        self.navigationController?.pushViewController(myColoursViewController, animated: true)
    }
    
    /*func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
        // println("buffer")
        let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        CVPixelBufferLockBaseAddress(imageBuffer, 0)
        
        let baseAddress = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0)
        let bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer)
        let width = CVPixelBufferGetWidth(imageBuffer)
        let height = CVPixelBufferGetHeight(imageBuffer)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        var bitmapInfo = CGBitmapInfo.fromRaw(CGImageAlphaInfo.PremultipliedFirst.toRaw())! | CGBitmapInfo.ByteOrder32Little
        
        let context = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, bitmapInfo)
        let imageRef = CGBitmapContextCreateImage(context)
        
        CVPixelBufferUnlockBaseAddress(imageBuffer, 0)
        
        var cImage = CIImage(CGImage:imageRef)
        
        let results:NSArray = detector.featuresInImage(cImage)
        // println(results.count)
        for r in results {
            let face:CIFaceFeature = r as CIFaceFeature;
            NSLog("Face found at (%f,%f) of dimensions %fx%f", face.bounds.origin.x, face.bounds.origin.y, face.bounds.width, face.bounds.height)
        }
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
