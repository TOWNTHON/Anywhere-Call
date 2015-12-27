//
//  LoginViewController.swift
//  AnywhereCall
//
//  Created by 広瀬緑 on 12/26/15.
//  Copyright © 2015 広瀬緑. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var myUIPicker: UIPickerView = UIPickerView()
    private let areaData: NSArray = ["未選択","東京","栃木","静岡","富山"]
    private let timeData: NSArray = ["未選択","06:00","07:00","08:00","09:00"]
    
    var myToolBar: UIToolbar!
    var myPickerView: UIPickerView!
    
    @IBOutlet weak var areaTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //PickerView作成
        myPickerView = UIPickerView()
        myPickerView.showsSelectionIndicator = true
        myPickerView.delegate = self
        
        //TextFieldに初期値設定
        areaTextField.placeholder = areaData[0] as? String;
        self.view.addSubview(areaTextField)
        timeTextField.placeholder = areaData[0] as? String;
        self.view.addSubview(timeTextField)
        
        //ToolBar作成（ニョキっと下から出てくるやつ）
        myToolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        myToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        myToolBar.backgroundColor = UIColor.blackColor()
        myToolBar.barStyle = UIBarStyle.Black
        myToolBar.tintColor = UIColor.whiteColor()
        
        //ToolBarを閉じるボタンを追加
        let myToolBarButton = UIBarButtonItem(title: "Close", style: .Bordered, target: self, action: "onClick:")
        myToolBarButton.tag = 1
        myToolBar.items = [myToolBarButton]
        
        //TextFieldをpickerViewとToolVerに関連づけ
        areaTextField.inputView = myPickerView
        areaTextField.inputAccessoryView = myToolBar
        timeTextField.inputView = myPickerView
        timeTextField.inputAccessoryView = myToolBar

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //表示列
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return areaData.count
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return areaData[row] as? String
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        areaTextField.text = areaData[row] as? String;
        timeTextField.text = timeData[row] as? String;
    }
    
    //閉じる
    func onClick(sender: UIBarButtonItem) {
        areaTextField.resignFirstResponder()
        timeTextField.resignFirstResponder()
    }
}
