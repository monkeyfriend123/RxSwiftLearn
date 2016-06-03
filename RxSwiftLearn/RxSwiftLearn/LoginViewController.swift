//
//  LoginViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/31.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift


class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passWordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "登录"
        
        Observable<Bool>.combineLatest(self.userNameTextField.rx_text, self.passWordTextField.rx_text) { (userName, passWord) -> Bool in
            return userName.characters.count > 0 && passWord.characters.count > 0
        }.bindTo(self.loginButton.rx_enabled).addDisposableTo(disposeBag)
        
        
        self.loginButton.rx_tap.subscribeNext {[unowned self] in
            let observable = login(self.userNameTextField.text!, self.passWordTextField.text!)
            observable.subscribeNext({(user) in
                
                UserCenter.instance.currentUser = user
                UserCenter.instance.loginState.value = .LoginStateLogined
                print(user)
            }).addDisposableTo(self.disposeBag)
            
            observable.subscribeError({ (error) in
                print(error)
            }).addDisposableTo(self.disposeBag)
        }.addDisposableTo(disposeBag)
        
        
        
        UserCenter.instance.loginState.asObservable().subscribeNext { [unowned self] (loginState) in
            if loginState == .LoginStateLogined{
                
                //请求imucid
                requestIMUcid().subscribe({ (event) in
                    if case let .Next(flag) = event{
                        if flag{
                            if let imucId = UserCenter.instance.currentUser?.imucId{
                                synchContacts("\(imucId)", pageNum: 1, pageSize: 10, timeStamp: nil)
                            }
                            
                        }
                    }
                }).addDisposableTo(self.disposeBag)
            }
        }.addDisposableTo(disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        print("deinit")
    }

}
