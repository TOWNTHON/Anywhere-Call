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
        let twilioNumber = "%2B815031775709"

        
        // 会員情報APIに接続
        let perInfoApi = NSMutableURLRequest(URL: NSURL(string:"http://anywherecall.html.xdomain.jp/per_info.json")!)
        
        
        //会員情報の取得
        let task = NSURLSession.sharedSession().dataTaskWithRequest(perInfoApi) {
            (data, response, error) in
            if let data = data, responseDetails = NSString(data: data, encoding: NSUTF8StringEncoding) {
                // Success
                print("Response: \(responseDetails)")
                
                let json = JSON(data:data)
                
                let selfTel = json["self_tel"].string
                let other_party_tel = json["other_party_info"][1]["tel"].string
                let other_party_name = json["other_party_info"][1]["name"].string
                
                // twilio APIに渡すリクエスト情報の設定
                let request = NSMutableURLRequest(URL: NSURL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/Calls.json")!)
                request.HTTPMethod = "POST"
                request.HTTPBody = "From=\(twilioNumber)&To=\(selfTel)&Url=http://anywherecall.php.xdomain.jp/process_gather.php?name=\(other_party_name)&tel=\(other_party_tel)".dataUsingEncoding(NSUTF8StringEncoding)
                
                
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
                
                
                
                
            } else {
                // Failure
                print("Error: \(error)")
            }
        }
        task.resume()
        
        
    }

}