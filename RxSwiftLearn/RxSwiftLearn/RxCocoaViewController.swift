//
//  RxCocoaViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/23.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxCocoaViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = self.textField.rx_text.bindTo(self.label.rx_text)

        
        _ = Observable<Bool>.combineLatest(self.textField.rx_text, self.passwordTextField.rx_text) {
            (str: String, str2: String) ->Bool in
                !str.isEmpty && !str2.isEmpty
            }.bindTo(self.loginButton.rx_enabled)
        
        let a: Bool? = nil
        let b: Bool? = nil
        print("a == b : \(a==b)")
        
        _ = self.loginButton.rx_observe(Bool.self, "enabled").distinctUntilChanged({ (lhs, rhs) -> Bool in
            return lhs == rhs
        }).subscribeNext { (enabled) in
            print(enabled ?? false)
        }
        
        
        
        _ = self.textField.rx_text.throttle(0.3, scheduler: MainScheduler.instance).subscribeNext {
            print($0)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    deinit{
        print("释放")
    }
}
