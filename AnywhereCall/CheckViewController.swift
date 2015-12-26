//
//  CheckViewController.swift
//  AnywhereCall
//
//  Created by 広瀬緑 on 12/26/15.
//  Copyright © 2015 広瀬緑. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {
    let id = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if(id.objectForKey("id") != nil){
            performSegueWithIdentifier("toTopController", sender: nil)
        }
        else{
            performSegueWithIdentifier("toLoginController", sender: nil)
        }
    }

}
