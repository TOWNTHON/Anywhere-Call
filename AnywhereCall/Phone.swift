//
//  Phone.swift
//  twilio
//
//  Created by kosuke ito on 2015/12/23.
//  Copyright © 2015年 kosuke ito. All rights reserved.
//
import SwiftyJSON
public class Phone {
 
    func sendCall()
    {
        
        let twilioSID = "ACda96929c287ebbfb4d6e1e3ae8eb9db7"
        let twilioSecret = "30c534e6e1acf6025efadf5c9558b436"
        
        //発信元電話番号
        let fromNumber = "%2B815031775709"
        //発信先電話番号
        let toNumber = "%2B819093186841"

        
        // twilio APIに渡すリクエスト情報の設定
        let request = NSMutableURLRequest(URL: NSURL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/Calls.json")!)
        request.HTTPMethod = "POST"
        request.HTTPBody = "From=\(fromNumber)&To=\(toNumber)&Url=https://demo.twilio.com/welcome/voice/ja/".dataUsingEncoding(NSUTF8StringEncoding)
        

        // twilio API実行
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            print("Finished")
            if let data = data, responseDetails = NSString(data: data, encoding: NSUTF8StringEncoding) {
                // Success
                print("Response: \(responseDetails)")
                
                let json = JSON(data:data)
                if let sid = json["sid"].string{
                    print("SID++++++:\(sid)")
                }
                
            } else {
                // Failure
                //print("Error: \(error)")
            }
        }).resume()
    }
    
    
}