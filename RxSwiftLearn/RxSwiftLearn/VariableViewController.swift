//
//  VariableViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/24.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift

class VariableViewController: UIViewController {

//    var variable: Variable<String?>?
    override func viewDidLoad() {
        super.viewDidLoad()
    

        let variable: Variable? = Variable<String?>(nil)
        
//        variable!.value = "A"
        
        _ = variable!.asObservable().subscribe({ (event) in
            
            switch event{
            case let .Next(element):
                print(element ?? "nil")
            case let .Error(error):
                print(error)
            case .Completed:
                print("complete")
            
            }
        })
        variable?.value = "B"
//        (variable?.asObservable() as! BehaviorSubject).on(.Completed)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    deinit{
        
        print("deinit")
    }

}
