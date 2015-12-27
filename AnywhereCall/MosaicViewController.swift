//
//  MosaicViewController.swift
//  AnywhereCall
//
//  Created by 広瀬緑 on 12/27/15.
//  Copyright © 2015 広瀬緑. All rights reserved.
//

import UIKit

extension UIImage{
    
    // 画像をResizeするクラスメソッド.
    class func ResizeÜIImage(image : UIImage, width : CGFloat, height : CGFloat)-> UIImage!{
        
        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSizeMake(width, height))
        
        // コンテキストに画像を描画する.
        image.drawInRect(CGRectMake(0, 0, width, height))
        
        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる.
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

class MosaicViewController: UIViewController {

    // ベース画像.
    let myInputImage = CIImage(image: UIImage(named: "woman-profile-image.jpg")!)
    var myImageView: UIImageView!
    
    var label : UILabel!
    
    // NSTimeInterval：時間を計算するメソッド
    var startTime = NSTimeInterval()
    
    // NSTimer：タイマーを管理するクラス
    var timer:NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //もし、〔スタートボタン：myBtnStart〕が押されたら〔関数：myStartTime〕を呼び出す
        if (!timer.valid) {
            let mySelector : Selector = "myStartTime"
            
            // NSTimer：タイマーを管理するクラス
            //（１）scheduledTimerWithTimeInterval：時間の間隔〔0.01〕
            //（２）target：タイマー発生時に呼び出すメソッドがあるtarget〔self〕
            //（３）selector：タイマー発生時に呼び出すメソッドを指定〔mySelector〕
            //（４）userInfo：selectorで呼びだすメソッドに渡す情報〔nil〕
            //（５）repeats：タイマーの実行を繰り返すかどうかの指定〔true〕
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: mySelector, userInfo: nil, repeats: true)
            
            // NSDate：日付と時間を管理するクラス
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
        
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "onValueChanged", userInfo: nil, repeats:true)
        
        
        // ラスタライズ化の初期化値.
        let initRasterizeValue : CGFloat = 0.04
        
        // スライダーを用意.
//        let rasterizeSlider = UISlider()
//        rasterizeSlider.layer.position = CGPointMake(self.view.frame.midX, self.view.frame.maxY - 50)
//        rasterizeSlider.layer.zPosition = 1
//        rasterizeSlider.minimumValue = 0.5
//        rasterizeSlider.maximumValue = 1.0
//        rasterizeSlider.value = Float(1.0 - initRasterizeValue)
//        rasterizeSlider.addTarget(self, action: "onValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
//        self.view.addSubview(rasterizeSlider)
        
        // UIImageに変換.
        let myInputUIImage: UIImage = UIImage(CIImage: myInputImage!)
        
        // リサイズされたUIImageを指定して、UIImageViewを作る.
        myImageView = UIImageView(image: UIImage.ResizeÜIImage(myInputUIImage, width: self.view.frame.maxX, height: self.view.frame.maxY))
        
        if myImageView != nil {
            
            // ラスタライズ化する.
            myImageView!.layer.shouldRasterize = true
            
            // 値の初期化.
            myImageView!.layer.rasterizationScale = initRasterizeValue
            
            self.view.addSubview(myImageView!)
        }
        
        label = UILabel(frame: CGRectMake(10, 10, 200, 40))
        label.text = "aaaaaaaa"
        label.textColor = UIColor.whiteColor()
        label.layer.position = CGPoint(x: self.view.bounds.width/2 , y: self.view.bounds.height/2)
        self.view.addSubview(label)
    }
    
    // Sliderの値が変わった時に呼ばれるメソッド
    func onValueChanged(slider : UISlider){
        
        if myImageView != nil {
            
            let doubleNum: Double = atof(label.text!)
            
            // ラスタライズ化する.
            myImageView!.layer.rasterizationScale = CGFloat(1.04 - doubleNum)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func myStartTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        // 現在の時間を調べるためにスタートします
        var myTime: NSTimeInterval = currentTime - startTime
        
        //〔分〕を計算
        // UInt8：8 ビット符号なし整数への変換
        // NSTimeInterval：引数に時間の長さを示す値
        let minutes = UInt8(myTime / 60.0)
        myTime -= (NSTimeInterval(minutes) * 60)
        
        //〔秒〕を計算
        let seconds = UInt8(myTime)
        myTime -= NSTimeInterval(seconds)
        
        //〔ミリ秒〕を計算
        let fraction = UInt8(myTime * 100)
        
        //〔分〕〔秒〕〔ミリ秒〕を文字列にします
        let timeMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let timeSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let timeFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        // 時間表示用のラベルに〔分〕〔秒〕〔ミリ秒〕を表示
        label.text = "\(timeMinutes):\(timeSeconds):\(timeFraction)"
    }

}
