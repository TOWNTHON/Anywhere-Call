//
//  TimeCount.swift
//  AnywhereCall
//
//  Created by 広瀬緑 on 12/27/15.
//  Copyright © 2015 広瀬緑. All rights reserved.
//

import Foundation

class TimeCount{
    
    // 開始時刻を保存する変数
    var startTime: NSDate
    var key: String
    
    // 処理開始
    init(key: String) {
        self.startTime = NSDate()
        self.key = key
    }
    
    // 処理終了
    func finish() {
        let elapsed = NSDate().timeIntervalSinceDate(self.startTime) as Double
        let formatedElapsed = String(format: "%.3f", elapsed)
        print("TimeCount: \(key), Elasped time: \(formatedElapsed)(s)")
    }
    
    // 処理をブロックで受け取る
    class func measure(key: String, block: () -> ()) {
        let benchmark = TimeCount(key: key)
        block()
        benchmark.finish()
    }
}
