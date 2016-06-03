//
//  URLHelper.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/31.
//  Copyright © 2016年 js. All rights reserved.
//

import Foundation
import UIKit

func +(dict1: Dictionary<String,AnyObject>, dict2: Dictionary<String,AnyObject>) -> Dictionary<String,AnyObject>{
    var resultDict = dict1
    
    for (key,val) in dict2{
        resultDict[key] = val
    }
    return resultDict
}


struct URLHelper{
    //MARK: -URL
    
    //http://api.pl.vd.cn
    //http://api.dev.vd.cn
    static let serverURL = "http://api.pl.vd.cn"
    
    static let loginURL = "\(serverURL)/v2/account/login"
    
    static let getPageInfoURL = "\(serverURL)/mengdianApp/getPageInfo"

    static let imTourURL = "\(serverURL)/user/tourl"
    static let imNewTourURL = "\(serverURL)/user/tourlnewport"
    
    //MARK: - IM-Tour  Method Name
    static let getUserServerURL = "cus-api/getCusServiceStatus"
    static let getContactsURL = "user/queryContactUsersByRole"
    
    static var baseRerequestParam: [String: AnyObject] {
        var param = [String: AnyObject]()
        param["BaseAppType"] = "ios"
        param["BaseAppVersion"] = "4.1.0"
        param["SystemVersion"] = UIDevice.currentDevice().systemVersion
        param["spreadChannel"] = "app store"
        
        if !(UserCenter.instance.currentUser?.token?.isEmpty ?? true){
            param["_token_"] = UserCenter.instance.currentUser?.token;
        }
        
        if !(UserCenter.instance.currentUser?.wid?.isEmpty ?? true){
            param["_wid_"] = UserCenter.instance.currentUser?.wid;
        }
        
        if !(UserCenter.instance.currentUser?.shopId?.isEmpty ?? true){
            param["shop_id"] = UserCenter.instance.currentUser?.shopId;
        }
        
        return param
    }
    
}


