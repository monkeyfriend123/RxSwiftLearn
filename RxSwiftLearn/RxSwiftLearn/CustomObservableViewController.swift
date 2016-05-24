//
//  CustomObservableViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/24.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift

class CustomObservableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CustomObserable"
        
    
        _ = requestFriendsList().observeOn(MainScheduler.instance).subscribe { [weak self] (event) in
            self?.title = "hello"
            
            if case let .Next(element) = event{
                print(element)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    deinit{
        print("deinit")
    }

}


//MARK: - Service

class User: CustomStringConvertible{
    var userName: String
    var age: Int
    init(userName: String = "", age: Int = 0){
        self.userName = userName
        self.age = age
    }
    
    
    var description: String{
        return "userName: \(userName), age: \(age)"
    }
    
}

func requestFriendsList() -> Observable<User>{
    return Observable<User>.create({ (observer) -> Disposable in
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { 
            sleep(2)
            
            observer.onNext(User(userName: "jisong", age: 26))
            observer.on(.Completed)
        })
        
        
        return NopDisposable.instance
    })
}