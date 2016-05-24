//
//  JustViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/23.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift

class JustViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Just"
        
        _ = Observable<Int>.deferred{
            return Observable<Int>.just(10)
        }
        let justSequence = Observable<Int>.just(10)
        
        let _ = justSequence.subscribe { (event) in
            print(event)
        }
        
        let _ = justSequence.subscribeNext { (value) in
            print(value)
        }
        
        
        
        let myJust = { (singleElement: Int) -> Observable<Int> in
            return Observable<Int>.create { observer in
                observer.on(.Next(singleElement))
                observer.on(.Completed)
                
                return NopDisposable.instance
            }
        }
        
        _ = myJust(5)
            .subscribe { event in
                print(event) 
        }
        
        
        _ = Observable<Int>.of(10,20,30).subscribe { (event) in
            print(event)
        }
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
