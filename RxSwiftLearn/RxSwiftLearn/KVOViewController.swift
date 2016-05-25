//
//  KVOViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/25.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift

class Config: NSObject{
    dynamic var flag: Bool

    init(flag: Bool){
        self.flag = flag
    }
    
    deinit{
        print("deinit")
    }
}

class KVOViewController: UIViewController {

    var config: Config = Config(flag: false)
    var config2: Config = Config(flag: true)
    var disposable: Disposable?
    var bag: DisposeBag?
    
    @IBOutlet var button: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "KVO"
        
        disposable = self.config.rx_observe(Bool.self, "flag").subscribeNext { (f) in
            print(f ?? false)
        }
        
        bag = DisposeBag()
        disposable?.addDisposableTo(bag!)
        
        self.config2.rx_observe(Bool.self, "flag").subscribeNext { (f) in
            print(f ?? false)
        }.addDisposableTo(bag!)

        
        _ = self.button?.rx_controlEvent(.TouchUpInside).asObservable().subscribeNext({[unowned self] in
            self.config.flag = !self.config.flag
        })
        
//        self.button?.rx_deallocating.subscribe({ (event) in
//            print(event)
//        })
//        
//        self.config.rx_deallocating.subscribe { (event) in
//            print(event)
//        }
    }
    
    @IBAction func changeButtonClicked(sender: AnyObject!){
//        self.config.flag = !self.config.flag
    }
    
    deinit{
        print("delint")
    }

}
