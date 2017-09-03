//
//  FirstTab_ViewController.swift
//  AI
//
//  Created by Philips on 17/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class FirstTab_ViewController: UIViewController,AVCaptureVideoDataOutputSampleBufferDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var subContentsVC: AnalyseImage_ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red:52.0/255.0 , green: 73.0/255.0, blue:94.0/255.0, alpha: 1.0)

        // Do any additional setup after loading the view.
        
        
      //  setupCameraSession()
        
       
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         subContentsVC = storyboard.instantiateViewController(withIdentifier: "AnalyseImage_ViewController") as! AnalyseImage_ViewController

       
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.layer.addSublayer(previewLayer)
        picker.delegate = self
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 120, y: 100)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.text = "1. Hi !! How was your day?"
        self.view.addSubview(label)
        label.didMoveToSuperview()
        
        
        let recordButton = UIButton(type: UIButtonType.custom)
        recordButton.frame = CGRect(x: 200, y: 200, width: 200, height: 21)
        recordButton.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
        self.view.addSubview(recordButton)
        recordButton.didMoveToSuperview()
        
       // cameraSession.startRunning()
    }
    
    
    func pressed(sender: UIButton!) {
        var alertView = UIAlertView();
        alertView.addButton(withTitle: "Ok");
        alertView.title = "title";
        alertView.message = "message";
        alertView.show();
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cameraSession.stopRunning()
        
    }
    
    
    let picker = UIImagePickerController()
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func photoFromLibrary(_ sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
     //   picker.popoverPresentationController?.barButtonItem = sender
    }
    
   @IBAction  func analyse()
    {
      //  let storyboard = UIStoryboard(name: "Main", bundle: nil)
       // let subContentsVC = storyboard.instantiateViewController(withIdentifier: "AnalyseImage_ViewController") as! AnalyseImage_ViewController
        self.navigationController?.pushViewController(subContentsVC!, animated: true)
    }
    
    @IBAction func shootPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
     @IBAction func  record(_ sender: UIButton) {
        /*
        let path : String = Bundle.main.path(forResource: "Recording_2", ofType:"mov")!
        print(path)
        //https://www.youtube.com/watch?v=TQR70KKYMmQ
        //let player = AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=TQR70KKYMmQ")!)
        
        let player = AVPlayer(playerItem: <#T##AVPlayerItem?#>)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        //self.addChildViewController(playerController)
        //self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
         self.navigationController?.pushViewController(playerController, animated: true)
        
        
        player.play()
        */
        
        guard let path = Bundle.main.path(forResource: "Recording_2", ofType:"mov") else {
            debugPrint("Recording_2 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
        player.play()
        }

        
        
    }
    
    
    
    lazy var cameraSession: AVCaptureSession = {
        let s = AVCaptureSession()
        s.sessionPreset = AVCaptureSessionPresetHigh
        return s
    }()
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let preview =  AVCaptureVideoPreviewLayer(session: self.cameraSession)
       // preview?.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
         preview?.bounds = CGRect(x: 0, y: 0, width: 400, height: 500)

        preview?.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        preview?.videoGravity = AVLayerVideoGravityResize
        return preview!
    }()
    
    func setupCameraSession() {
     //   let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) as AVCaptureDevice
       
       
       // print(captureDevice)
        
        let captureDevice = AVCaptureDevice.defaultDevice(withDeviceType: AVCaptureDeviceType.builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: AVCaptureDevicePosition.front)

        
        do {
            let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
           
            cameraSession.beginConfiguration()
            
            if (cameraSession.canAddInput(deviceInput) == true) {
                cameraSession.addInput(deviceInput)
            }
            
        
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString) : NSNumber(value: kCVPixelFormatType_420YpCbCr8BiPlanarFullRange as UInt32)]
            dataOutput.alwaysDiscardsLateVideoFrames = true
            
            if (cameraSession.canAddOutput(dataOutput) == true) {
                cameraSession.addOutput(dataOutput)
            }
            
            cameraSession.commitConfiguration()
            
            let queue = DispatchQueue(label: "com.invasivecode.videoQueue")
            dataOutput.setSampleBufferDelegate(self, queue: queue)
            
        }
        catch let error as NSError {
            NSLog("\(error), \(error.localizedDescription)")
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        // Here you collect each frame and process it
        print("didOutputSampleBuffer")
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didDrop sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        // Here you can count how many frames are dopped
        print("didDrop")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Delegates
     func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        var  chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        //myImageView.contentMode = .scaleAspectFit //3
       // myImageView.image = chosenImage //4
        
        
        UIImageWriteToSavedPhotosAlbum(chosenImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        dismiss(animated:true, completion: nil) //5
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
