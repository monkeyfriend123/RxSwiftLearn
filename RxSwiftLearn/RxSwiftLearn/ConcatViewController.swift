//
//  ConcatViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/23.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift

func example(name: String,task: ()->()){
    print("------\(name)--------")
    task()
}

class ConcatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        example("contact") { 
            let var1 = BehaviorSubject(value: 0)
            let var2 = BehaviorSubject(value: 200)
            
            // var3 is like an Observable<Observable<Int>>
            let var3 = BehaviorSubject(value: var1)
            
            _ = var3
                .concat()
                .subscribe {
                    print($0)
            }
            
            var1.on(.Next(1))
            var1.on(.Next(2))
            
            var3.on(.Next(var2))
            
            var2.on(.Next(201)) 
            
            var1.on(.Next(3)) 
            var1.on(.Completed) 
            
            var2.on(.Next(202))
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
