//
//  ViewController.swift
//  AnywhereCall
//
//  Created by 広瀬緑 on 12/18/15.
//  Copyright © 2015 広瀬緑. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    var phone:Phone = Phone()
    internal var window: UIWindow?
    
    @IBOutlet weak var CallView: UIImageView!
    let backgroundAnimationImage = FLAnimatedImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("calling", ofType: "gif")!
        let url = NSURL(fileURLWithPath: path)
        let animatedImage = FLAnimatedImage(animatedGIFData: NSData(contentsOfURL: url))
        
        let frame:CGRect = CGRect(x: 0, y: (self.view.bounds.height)/2-150, width: 400, height: 300)
        
        
        backgroundAnimationImage.animatedImage = animatedImage
        backgroundAnimationImage.frame = frame
        view.insertSubview(backgroundAnimationImage, atIndex: 5)
        
        CallView.userInteractionEnabled = true
        CallView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageTapped:"))
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imageTapped(sender: UITapGestureRecognizer) {

        
        // ViewControllerを生成する.
        let myMosaicViewController: MosaicViewController = MosaicViewController()

        myMosaicViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(myMosaicViewController, animated: true, completion:nil)
        
        // UIWindowを生成する.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // rootViewControllerにNatigationControllerを設定する.
        self.window?.rootViewController = myMosaicViewController
        
        self.window?.makeKeyAndVisible()
        
        //Callボタン押下でtwilioから電話をかける
//        phone.sendCall()

    }
    
    
    

}

