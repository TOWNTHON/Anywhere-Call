//
//  MosaicViewController.swift
//  AnywhereCall
//
//  Created by 広瀬緑 on 12/27/15.
//  Copyright © 2015 広瀬緑. All rights reserved.
//

import UIKit
import CoreImage
import QuartzCore

class MosaicViewController: UIViewController {

    // ベース画像.
    let myInputImage = CIImage(image: UIImage(named: "woman-profile-image.jpg")!)
    var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UIImageに変換.
        let myInputUIImage: UIImage = UIImage(CIImage: myInputImage!)
        
        // ImageView.
        myImageView = UIImageView(frame: CGRectMake(0, 0, 400, 640))
        myImageView.image = myInputUIImage
        myImageView.layer.shouldRasterize = true
        myImageView.layer.rasterizationScale = 0.1
        myImageView.layer.minificationFilter = kCAFilterTrilinear
        myImageView.layer.magnificationFilter = kCAFilterNearest
        
        self.view.addSubview(myImageView)
        
//        // CIFilterを生成。nameにどんなを処理するのか記入.
//        let myPixellateFilter = CIFilter(name: "CIPixellate")
//        
//        // ぼかし処理をいれたい画像をセット.
//        myPixellateFilter!.setValue(myInputImage, forKey: kCIInputImageKey)
//        
//        // フィルターを通した画像をアウトプット.
//        let myOutputImage : CIImage = myPixellateFilter!.outputImage!
//        
//        // UIImageに変換.
//        let myOutputUIImage: UIImage = UIImage(CIImage: myOutputImage)
//        
//        // 再びUIViewにセット
//        myImageView.image = myOutputUIImage
//        
//        // 再描画.
//        myImageView.setNeedsDisplay()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
