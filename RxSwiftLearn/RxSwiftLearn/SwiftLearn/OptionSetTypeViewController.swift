//
//  OptionSetTypeViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/26.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit

struct SearchType: OptionSetType{
    
    var rawValue = 0
    static var SearchLocal = SearchType(rawValue: 1 << 0)
    static var SearchRemote = SearchType(rawValue: 1 << 1)
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

enum Sex: CustomStringConvertible{
    case Man
    case Woman
    
    var description: String{
        switch self {
        case .Man:
            return "Man"
        case .Woman:
            return "Woman"
        }
    }
}


class OptionSetTypeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "OptionSetType"
        
        let searchType: SearchType = [.SearchLocal,.SearchRemote]
        
        if searchType.contains(.SearchLocal){
            print("SearchLocal")
        }
        
        
        if searchType.contains(.SearchRemote){
            print("SearchRemote")
        }
        
        
        
        let sex: Sex = .Man
        print(sex)
        
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
