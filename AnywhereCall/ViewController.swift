//
//  ViewController.swift
//  AnywhereCall
//
//  Created by 広瀬緑 on 12/18/15.
//  Copyright © 2015 広瀬緑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var phone:Phone = Phone()
    
    //Callボタン押下でtwilioから電話をかけます。
    @IBAction func CallButton(sender: AnyObject) {
        phone.sendCall()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

