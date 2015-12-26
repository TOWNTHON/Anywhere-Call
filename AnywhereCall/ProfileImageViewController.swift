//
//  ProfileImageViewController.swift
//  AnywhereCall
//
//  Created by 広瀬緑 on 12/26/15.
//  Copyright © 2015 広瀬緑. All rights reserved.
//

import UIKit

class ProfileImageViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectProfileImageButton(sender: AnyObject) {
        let alertController = UIAlertController(title: "写真を選択してください", message: "", preferredStyle: .ActionSheet)
        let cameraAction = UIAlertAction(title: "カメラで撮影する", style: .Default) {
            action in
            print("Pushed Camera")
            self.pickImageFromCamera()
        }
        let libraryAction = UIAlertAction(title: "ライブラリから選択する", style: .Default) {
            action in
            print("Pushed Library")
            self.pickImageFromLibrary()
            
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel) {
            action in
            print("Pushed CANCEL")
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(libraryAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // 写真を撮ってそれを選択
    func pickImageFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    // ライブラリから写真を選択する
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    // 写真を選択した時に呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        
        // 選択した画像パスを取得
        if info[UIImagePickerControllerOriginalImage] != nil {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            print(image)
        }
    
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
