//
//  ZipViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/23.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift

class ZipViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sequence1 = PublishSubject<Int>()
        let sequence2 = PublishSubject<String>()
        
        _ = Observable<AnyObject>.zip(sequence1, sequence2) {
            "\($0) + \($1)"
            }.subscribe {
                print($0)
        }
        
        sequence1.on(.Next(1))
        sequence1.on(.Next(2))
        sequence2.on(.Next("A"))
        
        
        
        let subject1 = PublishSubject<Int>()
        let subject2 = PublishSubject<Int>()
        
    
        subject1.on(.Next(1))
        subject1.on(.Next(2))
        subject2.on(.Next(3))
        subject1.on(.Next(4))
        subject2.on(.Next(5))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
