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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ラスタライズ化の初期化値.
        let initRasterizeValue : CGFloat = 0.04
        
        // スライダーを用意.
        let rasterizeSlider = UISlider()
        rasterizeSlider.layer.position = CGPointMake(self.view.frame.midX, self.view.frame.maxY - 50)
        rasterizeSlider.layer.zPosition = 1
        rasterizeSlider.minimumValue = 0.5
        rasterizeSlider.maximumValue = 1.0
        rasterizeSlider.value = Float(1.0 - initRasterizeValue)
        rasterizeSlider.addTarget(self, action: "onValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(rasterizeSlider)
        
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
    }
    
    // Sliderの値が変わった時に呼ばれるメソッド
    func onValueChanged(slider : UISlider){
        
        if myImageView != nil {
            
            // ラスタライズ化する.
            myImageView!.layer.rasterizationScale = CGFloat(1.04 - slider.value)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
