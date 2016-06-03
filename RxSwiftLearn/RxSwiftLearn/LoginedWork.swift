//
//  LoginedWork.swift
//  RxSwiftLearn
//  登录完成后，进行的操作
//  Created by js on 16/6/2.
//  Copyright © 2016年 js. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import SwiftyJSON


func requestIMUcid() -> Observable<Bool>{
    return Observable<Bool>.create({ (observer) -> Disposable in
        
        let currentUser = UserCenter.instance.currentUser;
        
        let dataParams = ["imType": "1", "bizType": "1", "clientType": "1",
                            "mobile":(currentUser?.mobile ?? ""),
                            "bizId": (currentUser?.shopId ?? "")]
        
        var postDict = [String: AnyObject]()
        postDict["data"] = JSON(dataParams).rawString(options: NSJSONWritingOptions(rawValue: 0))
        postDict["tourl"] = URLHelper.getUserServerURL
        postDict = postDict + URLHelper.baseRerequestParam
        postDict["_sign_"] = postDict.sign
        
        let requestId = "0_\(NSUUID().UUIDString)"
        
        Alamofire.request(.POST, URLHelper.imNewTourURL, parameters: postDict, encoding: .JSON,headers: ["requestId":requestId]).responseJSON(completionHandler: { (response) in
            switch response.result{
            case .Success(let dataDict):
                let json = JSON(dataDict)
                
                if json["code"]["errcode"].intValue == 0{
                    let dataJSON = json["data"]
                
                    let currentUser = UserCenter.instance.currentUser;
                    currentUser?.imucId = dataJSON["imucId"].int64
                    currentUser?.imucPassword = dataJSON["imucPassword"].string
                    currentUser?.nickName = dataJSON["nickName"].string
                    UserCenter.instance.currentUser = currentUser
                    
                    observer.onNext(true)
                }
                else{
                   print("error")
                }
            case .Failure(let error) :
                observer.onError(error)
            }
            observer.onCompleted()
        })
        
        
        return NopDisposable.instance
    })
}