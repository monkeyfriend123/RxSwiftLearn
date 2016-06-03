//
//  Service.swift
//  RxSwiftLearn
//
//  Created by js on 16/6/1.
//  Copyright © 2016年 js. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import ObjectMapper
import SwiftyJSON
import CryptoSwift

//MARK: - 登录

func login(userName: String, _ passWord: String) -> Observable<MDUser>{
    
    return Observable<MDUser>.create { (observer) -> Disposable in
        var postDict = [String: AnyObject]()
        postDict["mobile"] = userName
        postDict["password"] = passWord
        postDict["device_uuid"] = DeviceInfo.idfaString()
        postDict["client_id"]  = "1"
        postDict["app_type"] = "ios"
        postDict = postDict + URLHelper.baseRerequestParam
        postDict["_sign_"] = postDict.sign
        
        let requestId = "0_\(NSUUID().UUIDString)"
        
        let request: Request = Alamofire.request(.POST, URLHelper.loginURL, parameters: postDict, encoding: .JSON,headers: ["requestId":requestId])
        
        request.responseJSON { (response) in
            switch response.result{
            case .Success(let dataDict):
                let json = JSON(dataDict)
                let code = json["code"]
                if code.rawString() == "0" {
                    let user = MDUser()
                    Mapper<MDUser>().map(json["data"].rawString()!, toObject: user)
                    observer.on(.Next(user))
                }
                else{
                    let error = NSError(domain: "", code:code.int ?? 10000,userInfo: nil)
                    observer.onError(error)
                }
            case .Failure(let error) :
                observer.onError(error)
            }
            observer.onCompleted()
        }
        
        return NopDisposable.instance
    }
}



//MARK: - 通讯录接口

func synchContacts(imucId: String,pageNum: Int,pageSize: Int,timeStamp: String?){
    let dataParams = ["roleType": 9999, "imucId": imucId, "pageNum": pageNum,
                      "pageSize": pageSize,
                      "timeStamp": (timeStamp ?? "")]
    
    var postDict = [String: AnyObject]()
    postDict["data"] = JSON(dataParams).rawString(options: NSJSONWritingOptions(rawValue: 0))
    postDict["tourl"] = URLHelper.getContactsURL
    postDict = postDict + URLHelper.baseRerequestParam
    postDict["_sign_"] = postDict.sign

    let requestId = "0_\(NSUUID().UUIDString)"
    Alamofire.request(.POST, URLHelper.imTourURL, parameters: postDict, encoding:.JSON,headers: ["requestId":requestId]).responseJSON {
        (response) in
        switch response.result{
        case .Success(let dataDict):
            let json = JSON(dataDict)
            
            if json["code"]["errcode"].intValue == 0{
                let totalCount = json["data"]["totalCount"].intValue
                let totalPage = json["data"]["totalPage"].intValue
                let items = json["data"]["items"].arrayObject
                
                let contacts =  Mapper<ContactInfo>().mapArray(items)
                print(contacts)
                
            }
            print(dataDict)
        case .Failure(let error):
            print(error)
        }
    }
}